#!/usr/bin/env bash

# AWS EC2 Lifecycle command
# =========================
# Tim Friske <me@tifr.de>
#
# Prints the minimum (min), maximum (max), average (avg), median (mdn) and
# number (cnt) of historic AWS EC2 Spot prices in the given region for each of
# the given instance types.
#
# The calculations are based on the past 90 days of AWS EC2 Spot price history.
# The prices are shown in US dollars per hour as if an instance was to run
# Linux/UNIX. The statistics are computed for each availability zone of a
# region. Subtotals and grand totals are displayed underneath their respective
# *all* JSON attributes.
#
# Instance types may be given as space- or comma-separated arguments or any
# combination thereof.
#
# Deps:: aws, bash, env, jq

shopt -os nounset errexit errtrace pipefail

: "${aws_region:="${AWS_REGION:-}"}"
: "${aws_region:="${AWS_DEFAULT_REGION:-}"}"
: "${aws_region:="$(aws configure get region)"}"
: "${aws_region:?AWS region required}"

aws_ec2_instance_types=()
for aws_ec2_it in "${@:?AWS EC2 instance types required}"; do
  IFS=, read -r -a aws_ec2_its <<< "${aws_ec2_it}"
  aws_ec2_instance_types+=("${aws_ec2_its[@]}")
done

read -d '' -r aws_ec2_spot_price_stats_query <<'AWS_EC2_SPOT_PRICE_STATS_QUERY' || true
  def avg:add/length;
  def mdn:sort|[.[length/2|ceil|-.,.-1]/2?]|add;
  def rnd($dp):.*pow(10;$dp)|round/pow(10;$dp);
  def obj:reduce .[] as $o ({};.*=$o);
  def stat:{
    min:[.[].min]|min,
    max:[.[].max]|max,
    avg:[.[].avg]|avg|rnd(4),
    mdn:[.[].mdn]|mdn|rnd(4),
    cnt:[.[].cnt]|add
  };
  .SpotPriceHistory
  | group_by(.AvailabilityZone)
  | map({(.[0].AvailabilityZone):group_by(.InstanceType)|map({(.[0].InstanceType):.})|obj})
  | obj
  | map_values(map_values([.[].SpotPrice|tonumber]|{
    min:min,max:max,avg:avg|rnd(4),mdn:mdn|rnd(4),cnt:length}))
  | map_values({per:.,all:to_entries|[.[].value]|stat})
  | {per:.,all:to_entries|[.[].value.all]|stat}
AWS_EC2_SPOT_PRICE_STATS_QUERY

aws ec2 describe-spot-price-history \
  --region "${aws_region}" \
  --product-descriptions Linux/UNIX \
  --instance-types "${aws_ec2_instance_types[@]}" \
  | jq "${aws_ec2_spot_price_stats_query}"

# Fzf program setup
# =================
# Tim Friske <me@tifr.de>

# 1. Allow user to select multiple _Git_ branches with _Fzf_.
# 2. Exit immediately if there is no matching _Git_ branch.
export FZF_GIT_BRANCH_FZF_OPTS='--multi --exit-0'

# 1. Allow user to select multiple _Git_ tags with _Fzf_.
# 2. Exit immediately if there is no matching _Git_ tag.
export FZF_GIT_TAG_FZF_OPTS='--multi --exit-0'

# 1. Allow user to select multiple jobs with _Fzf_.
# 2. Exit immediately if there is no matching job.
export FZF_JOBS_FZF_OPTS='--multi --exit-0'

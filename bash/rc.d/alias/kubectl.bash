# Bash aliases for Kubectl
# ========================
# Tim Friske <me@tifr.de>

# Define aliases for the most common commands to control _Kubernetes_
# clusters via the `kubectl` program.
#
if type -p kubectl &> /dev/null; then
  alias k='kubectl'
  alias ka='kubectl apply'
  alias kc='kubectl cp'
  alias kd='kubectl describe'
  alias ke='kubectl explain'
  alias kg='kubectl get'
  alias ki='kubectl cluster-info'
  alias kl='kubectl logs'
  alias ko='kubectl config'
  alias kp='kubectl patch'
  alias kr='kubectl delete'
  alias kt='kubectl top'
  alias kv='kubectl version'
  alias kx='kubectl exec'
fi

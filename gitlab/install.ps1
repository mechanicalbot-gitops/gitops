# helm repo add gitlab https://charts.gitlab.io/
# helm repo update

$gitlabName = "asd" # <name>-gitlab-initial-root-password
$gitlabPasswordBase64 = kubectl get secret $gitlabName -ojsonpath='{.data.password}'
$gitlabPassword = [System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String($gitlabPasswordBase64))
echo "gitlab password:\n$gitlabPassword"
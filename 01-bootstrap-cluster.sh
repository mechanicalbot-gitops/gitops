kubectl apply -k ./bootstrap

kubectl wait --for condition=established crd/applications.argoproj.io
kubectl apply -f ./bootstrap/argocd.yaml
kubectl apply -f ./bootstrap/apps.yaml

argocd_password=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
while [ -z "$argocd_password" ]
  do
    echo "Waiting for argocd admin password"
    argocd_password=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d)
    sleep 10
  done

echo "argocd admin password:\n$argocd_password"
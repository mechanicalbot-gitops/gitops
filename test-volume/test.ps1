kubectl apply -f ./m.yml
# $POD=$(kubectl get pod -l app=my-busybox -o jsonpath="{.items[0].metadata.name}")
# kubectl exec --stdin --tty $POD -- /bin/sh
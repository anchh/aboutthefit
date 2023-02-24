echo "1"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.7/config/manifests/metallb-native.yaml
echo "2"
kubectl wait --namespace metallb-system  --for=condition=ready pod  --selector=app=metallb --timeout=90s
echo "3"
kubectl apply -f https://kind.sigs.k8s.io/examples/loadbalancer/metallb-config.yaml
echo "4"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
echo "5"
kubectl wait --namespace ingress-nginx --for=condition=ready pod  --selector=app.kubernetes.io/component=controller --timeout=90s
echo "6"
.PHONY: clean create helm-install helm-upgrade

.SILENT:

clean:
	kind delete cluster
	rm -f kind.conf &>/dev/null \
	rm ./helms/ingress-nginx/Chart.lock &>/dev/null

create: context
	kind create cluster --config ./Cluster.yaml

## Makes the command edit this kubeconfig instead of whatever youre using
context:
	export KUBECONFIG=kubeconfig.yaml

create-namespace:
	kubectl create namespace ingress-nginx || true

helm-install: create-namespace
	helm dependency build ./helms/ingress-nginx && helm install ingress-nginx ./helms/ingress-nginx -n ingress-nginx

helm-upgrade:
	helm dependency build ./helms/ingress-nginx && helm upgrade ingress-nginx ./helms/ingress-nginx -n ingress-nginx

apply:
	kubectl apply -f ./k8s-manifests/

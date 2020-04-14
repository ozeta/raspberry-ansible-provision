https://github.com/bbruun/k3s-getting-started
https://kubernetes.io/docs/tasks/access-application-cluster/list-all-running-container-images/

kubectl get pods --namespace=kube-system

kubectl get pods --all-namespaces

kubectl get pods --all-namespaces -o=jsonpath='{range .items[*]}{"\n"}{.metadata.name}{":\t"}{range .spec.containers[*]}{.image}{", "}{end}{end}' | sort


UPGRADE TRAEFIK CHART

sudo nano  /var/lib/rancher/k3s/server/manifests/traefik.yaml

    dashboard.enabled: "true"
    dashboard.domain: "dashboard.traefik"
    
    
    sudo nano /etc/hosts
    127.0.0.1 dashboard.traefik

https://kauri.io/38-install-and-configure-a-kubernetes-cluster-with/418b3bc1e0544fbc955a4bbba6fff8a9/a

export K3S_KUBECONFIG_MODE="644"
export INSTALL_K3S_EXEC=" --no-deploy servicelb --no-deploy traefik"
https://kubernetes.io/docs/tasks/access-application-cluster/list-all-running-container-images/

kubectl get pods --namespace=kube-system

kubectl get pods --all-namespaces

kubectl get pods --all-namespaces -o=jsonpath='{range .items[*]}{"\n"}{.metadata.name}{":\t"}{range .spec.containers[*]}{.image}{", "}{end}{end}' | sort


UPGRADE TRAEFIK CHART

sudo nano  /var/lib/rancher/k3s/server/manifests/traefik.yaml

    dashboard.enabled: "true"
    dashboard.domain: "dashboard.traefik"
    
    
    sudo nano /etc/hosts
    127.0.0.1 traefik
sudo helm upgrade -f /var/lib/rancher/k3s/server/manifests/traefik.yaml traefik https://%{KUBERNETES_API}%/static/charts/traefik-1.81.0.tgz

### GitOps 

A3Lab GitOps com ArgoCD

#### Build e Push Mkdocs

```sh
mkdocs new app
docker build -t westerley/app .
docker run -p 8000:8000 westerley/app
docker push westerley/app
```

#### Install ArgoCD

```sh
# 1 - Create namespace
kubectl create namespace argocd

# 2 - Install argo-cd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# 3 - Port forward
kubectl port-forward svc/argocd-server -n argocd 8080:443

# 4 - Login Using The CLI
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```

#### Create secret
```sh
kubectl create secret generic ssh-private-secret --from-file=sshPrivateKey=/home/<user>/.ssh/id_rsa -n argocd
```

#### Create configmap
```sh
kubectl apply -f k8s/argocd/configmap.yaml
```

#### Apply argocd application
```sh
kubectl apply -f applications/web-private.yaml
```

#### Reference

https://argo-cd.readthedocs.io/en/release-1.8/operator-manual/declarative-setup/


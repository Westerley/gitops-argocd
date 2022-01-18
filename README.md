### GitOps 

#### Instalação ArgoCD

```sh

```

docker build -t westerley/app .
docker run -p 8000:8000 westerley/app
docker push westerley/app

```sh
kubectl create secret generic ssh-private-secret --from-file=sshPrivateKey=/home/<user>/.ssh/id_rsa -n argocd
```
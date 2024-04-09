# OPA Server

## Installation

### Install minikube

Please refer to https://minikube.sigs.k8s.io/docs/start/


### Create ssl certificate

Run these one by one to create ssl certificate
```shell
openssl genrsa -des3 -out server.key 2048
```
```shell
openssl req -new -key server.key -out server.csr
```
```shell
cp server.key server.key.org
```
```shell
openssl rsa -in server.key.org -out server.key
```
```shell
openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
```

---

### Set ssl certificate and other data to configmap
We only need server.crt and server.key to configmap
```shell
kubectl create configmap opa-server-crt --from-file ./server.crt
```
```shell
kubectl create configmap opa-server-key --from-file ./server.key
```

Adding other file required to configmap
```shell
kubectl create configmap permission-rego --from-file ./permission.rego
```
```shell
kubectl create configmap permission-data --from-file ./data.json
```
```shell
kubectl create configmap opa-auth --from-file ./opa-auth.rego
```


### Deploy to minikube
```shell
kubectl apply -f ./deploy.yaml
```

This opa service should be deployed on the same kube with opa implementation service. Then opa implementation service will be able to access the opa service internally. 

For opa implementation on python see https://github.com/mhseptiadi/opa-py

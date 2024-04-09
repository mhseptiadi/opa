# OPA Server

## Installation

### Install minikube

Please refer to https://minikube.sigs.k8s.io/docs/start/


### Create config map 
```angular2html
kubectl create configmap permission-rego --from-file ./permission.rego
kubectl create configmap permission-data --from-file ./data.json
kubectl create configmap opa-auth --from-file ./opa-auth.rego
```


### Deploy to minikube
```angular2html
kubectl apply -f ./deploy.yaml
```

This opa service should be deployed on the same kube with opa implementation service. Then opa implementation service will be able to access the opa service internally. 

For opa implementation on python see https://github.com/mhseptiadi/opa-py

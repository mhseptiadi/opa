# OPA Server

## Installation

### Install minikube

Please refer to https://minikube.sigs.k8s.io/docs/start/


### Create config map 
```angular2html
kubectl create configmap permission-rego --from-file ./permission.rego
kubectl create configmap permission-data --from-file ./data.json
```


### Deploy to minikube
```angular2html
kubectl apply -f .\deploy.yaml
```

This opa service should not be exposed and can be accessed from other opa implementation service. For opa implementation on python see https://github.com/mhseptiadi/opa-py

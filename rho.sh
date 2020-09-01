#!/bin/bash
#
kubectl apply -f elf.namespace.yaml
helm repo add elastic https://helm.elastic.co
helm repo add fluent https://fluent.github.io/helm-charts
helm repo update
helm install elasticsearch elastic/elasticsearch --version=7.9.0 --namespace=rho
helm install fluent-bit fluent/fluent-bit --namespace=rho
helm install kibana elastic/kibana --version=7.9.0 --namespace=rho --set service.type=LoadBalancer
kubectl run random-logger --image=chentex/random-logger -n rho
kubectl apply -f ingress.yaml -n rho

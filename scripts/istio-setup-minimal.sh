#!/bin/bash

curl -L https://istio.io/downloadIstio | sh -
cd $(find . -maxdepth 1 -type d -name "istio*")
export PATH=$PWD/bin:$PATH

kubectl create namespace istio-system
istioctl install -y --set profile=minimal
kubectl get pods -n istio-system

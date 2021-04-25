#!/bin/bash
echo "Installing Istio"
sh scripts/istio-setup.sh
kubectl get namespace -L istio-injection
if kubectl apply -f ortelius-istio/ ; then
     echo "Your Istio routing is ready!"
else
     echo "Something went wrong with your deployment :'("
fi
kubectl apply -f `(find -maxdepth 1 -type d -name "istio-*.*.*")`/samples/addons/prometheus.yaml
kubectl apply -f `(find -maxdepth 1 -type d -name "istio-*.*.*")`/samples/addons/grafana.yaml
kubectl apply -f `(find -maxdepth 1 -type d -name "istio-*.*.*")`/samples/addons/kiali.yaml
echo "Re creating Ortelius pod..."
kubectl delete $(kubectl get pods -o name|grep ortelius) -n ortelius

#!/bin/bash
echo "Installing Istio"
sh scripts/istio-setup-minimal.sh
kubectl label namespace default istio-injection=enabled --overwrite
kubectl get namespace -L istio-injection
if kubectl apply -f ortelius-istio/ ; then
     echo "Your Istio routing is ready!"
else
     echo "Something went wrong with your deployment :'("
fi

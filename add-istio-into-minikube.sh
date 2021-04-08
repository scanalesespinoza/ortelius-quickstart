#!/bin/bash
echo "Installing Istio"
if kubectl apply -f ortelius-istio/ ; then
     echo "Your Istio routing is ready!"
else
     echo "Something went wrong with your deployment :'("
fi

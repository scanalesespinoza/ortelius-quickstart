#!/bin/bash

if `kubectl create ns ortelius > /dev/null 2>&1` ; then
		echo "Ortelius namespace created"
	else
		echo "Ortelius namespace already present"
fi

kubectl label namespace ortelius istio-injection=enabled --overwrite
kubectl config set-context --current --namespace=ortelius

echo "Select your run action"
optionList=("install" "upgrade" "uninstall")

select OPTION in ${optionList[@]};
do
     echo "You picked $OPTION ($REPLY), working on it..."
     if helm $OPTION ortelius-app ortelius-k8s-chart/ ; then

	     echo "Your Ortelius App is creating!"
	     while [ `kubectl get $(kubectl get pods -o name) --output="jsonpath={.status.phase}"` != "Running"  ]
	     do
		  echo "Deploying Ortelius ..."
		  echo "Phase:" $(kubectl get $(kubectl get pods -o name) --output="jsonpath={.status.phase}")
		  sleep 5
	     done
	     echo "Phase:" $(kubectl get $(kubectl get pods -o name) --output="jsonpath={.status.phase}")
	     echo "Deploying Ortelius ... COMPLETE!"
	     exit
     else
	     echo "Something went wrong with your deployment :'("
	     exit
     fi
done

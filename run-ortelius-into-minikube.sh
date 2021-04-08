#!/bin/bash


echo "Select your run action"
optionList=("install" "upgrade" "uninstall")

select OPTION in ${optionList[@]};
do
     echo "You picked $OPTION ($REPLY), working on it..."
     if helm $OPTION ortelius-app ortelius-minikube-chart/ ; then
	     echo "Your Ortelius App is ready!"
	     exit
     else
	     echo "Something went wrong with your deployment :'("
	     exit
     fi
done

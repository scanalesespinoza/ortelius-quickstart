#!/bin/bash
xdg-open "$(minikube service ortelius-app-ortelius-chart -n ortelius --url)/dmadminweb" > /dev/null 2>&1

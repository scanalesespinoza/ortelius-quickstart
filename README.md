# Usage

- Install minikube
- Start you cluster
- Create/Select your namespace
- Add exexution permissions to "run-ortelius-into-minikube.sh" -> ```chmod +x run-ortelius-into-minikube.sh```
- Run and enjoy! -> ```./run-into-minikube.sh```

# Addind Istio

- Add exexution permissions to "add-istio-into-minikube.sh" -> ```chmod +x add-istio-into-minikube.sh```
- Run Istio add script -> ```./add-istio-into-minikube.sh```

# Tested on
minikube version: v1.4.0

# Folders description

- istio-ortelius: Contains all the yamls needed for istio routing to ortelius console.
- scripts: Support script with istio installation.
- ortelius-minikube: Contains the basic yamls to get running ortelius in kubernetes/minikube.
- ortelius-minikube: Contains a basic helm chart to deploy ortelius in kubernetes/minikube.

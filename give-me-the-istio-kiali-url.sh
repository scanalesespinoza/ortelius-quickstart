#!/bin/bash
$(find -maxdepth 1 -type d -name "*istio-*.*.*")/bin/istioctl dashboard kiali 

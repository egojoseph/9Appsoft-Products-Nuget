#!/bin/bash

yes | cp -rf service.yaml deploy.yaml

sed -i "s/imgtag/$VERSION/" deploy.yaml
sed -i "s/cfgprofile/$NAMESPACE/" deploy.yaml

aws eks --region $AWS_DEFAULT_REGION update-kubeconfig --name $CLUSTER_NAME

kubectl apply -f deploy.yaml --namespace=wayabank-$NAMESPACE

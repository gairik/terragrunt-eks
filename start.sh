#!/bin/bash

terragrunt apply -auto-approve

cluster="terraform-eks-demo"
region="us-east-1"
terragrunt output -raw kubeconfig > ~/.kube/config
aws eks --region $region update-kubeconfig --name $cluster

sleep 5

# Nodes start to join cluster
terragrunt output -raw config-map-aws-auth > config-map-aws-auth.yaml 
kubectl apply -f config-map-aws-auth.yaml


## See nodes coming up
```
kubectl get nodes
```

## Create autoscaler config as k8s resource 
https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/cloudprovider/aws/examples/cluster-autoscaler-autodiscover.yaml

```
kubectl apply -f cluster-autoscaler-autodiscover.yaml

```
## Play around by creating Deployment and scale up to test

``` 
kubectl create -f stressload-deployment.yaml 
kubectl scale deployment application-cpu --replicas=5
kubectl get nodes -w
```

## Destroy
Make sure all the resources created by Kubernetes are removed (LoadBalancers, Security groups), and issue:
```
terraform destroy
```

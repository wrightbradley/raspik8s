First you need to label all of your nodes.  This bash 1-liner will apply the necessary label to all Ready nodes:

```
for i in `kubectl get nodes --show-labels |grep -v plan.upgrade.cattle.io/k3os-latest |grep Ready |awk '{print $1}'`; do kubectl label nodes $i plan.upgrade.cattle.io/k3os-latest=true; done
```

Next apply the modified system upgrade controller config

```
kubectl apply -f system-upgrade-controller.yaml 
```

Next upgrade your server

```
kubectl apply -f k3os-server-upgrade.yaml 
```

Finally upgrade your worker(s)

```
kubectl apply -f k3os-worker-upgrade.yaml 
```

If you want to see some logs as the upgrade is going on you can do this:

```
kubectl get pods -n k3os-system

# Look for the pod named similar to 'apply-k3os-latest'
kubectl logs <pod name> -n k3os-system 
```

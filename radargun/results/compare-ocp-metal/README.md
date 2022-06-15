# Radargun test OCP/metal comparison

[Common benchmark](benchmark-hotrod-basic-4pod.xml)

# Results
## OCP
[run1](ocp/run1/results/html/index.html), [net stats](ocp/run1/ping-stats.log)  
[run2](results/compare-ocp-metal/ocp/run2/results/html/index.html),  [net stats](results/compare-ocp-metal/ocp/run2/ping-stats.log)  
[run3](results/compare-ocp-metal/ocp/run3/results/html/index.html), [net stats](results/compare-ocp-metal/ocp/run3/ping-stats.log)  
[run4](results/compare-ocp-metal/ocp/run4/results/html/index.html),  [net stats](results/compare-ocp-metal/ocp/run4/ping-stats.log)  
[run5](results/compare-ocp-metal/ocp/run5/results/html/index.html),  [net stats](results/compare-ocp-metal/ocp/run5/ping-stats.log)  
[run6](results/compare-ocp-metal/ocp/run6/results/html/index.html),  [net stats](results/compare-ocp-metal/ocp/run6/ping-stats.log)  
[run7](results/compare-ocp-metal/ocp/run7/results/html/index.html),  [net stats](results/compare-ocp-metal/ocp/run7/ping-stats.log)  
[run8](results/compare-ocp-metal/ocp/run8/results/html/index.html),  [net stats](results/compare-ocp-metal/ocp/run8/ping-stats.log)  

## Metal
[run1](results/compare-ocp-metal/metal/run1/results/html/index.html),  [net stats](results/compare-ocp-metal/metal/run1/ping-stats.log)  
[run2](results/compare-ocp-metal/metal/run2/results/html/index.html),  [net stats](results/compare-ocp-metal/metal/run2/ping-stats.log)  
[run3](results/compare-ocp-metal/metal/run3/results/html/index.html),  [net stats](results/compare-ocp-metal/metal/run3/ping-stats.log)  
[run4](results/compare-ocp-metal/metal/run4/results/html/index.html),  [net stats](results/compare-ocp-metal/metal/run4/ping-stats.log)  
[run5](results/compare-ocp-metal/metal/run5/results/html/index.html),  [net stats](results/compare-ocp-metal/metal/run5/ping-stats.log)  
[run6](results/compare-ocp-metal/metal/run6/results/html/index.html),  [net stats](results/compare-ocp-metal/metal/run6/ping-stats.log)  

# OCP SETUP

[BasicOperationsTest](html/index.html)

Quicklab procedure:
1. https://quicklab.upshift.redhat.com/clusters new Cluster
2. Select template: openshift4upi
3. Select region: pick up one available
4. Days of reservation 7
5. enter a name, select 1 master and 3 workers
6. When provisioned install new bundle Openshift 4.x

OCP on Quicklab:
1 master: 16Gb, 8 CPU
3 workers: 8Gb , 4 CPU each

```
Cluster Information
Username: quicklab
Hosts:
upi-0.vrigamon0531.lab.pnq2.cee.redhat.com ( 10.74.178.204 )

Username: quicklab
CoreOS Hosts:
master-0.vrigamon0531.lab.pnq2.cee.redhat.com ( 10.74.183.106 )
worker-0.vrigamon0531.lab.pnq2.cee.redhat.com ( 10.74.179.175 )
worker-2.vrigamon0531.lab.pnq2.cee.redhat.com ( 10.74.179.88 )
worker-1.vrigamon0531.lab.pnq2.cee.redhat.com ( 10.74.181.159 )

Openshift Kubeconfig Located At:
upi-0.vrigamon0531.lab.pnq2.cee.redhat.com:/home/quicklab/oc4/auth/kubeconfig

Clusterversion Output:

NAME      VERSION   AVAILABLE   PROGRESSING   SINCE   STATUS
version   4.10.12   True        False         30s     Cluster version is 4.10.12
```

Infinispan CR: [example-infinispan](example-infinispan.yaml)

## Radargun Deployment

Deploy a [client](deployment-radargun-client.yaml), the deployment expects some env var setting, you only need ISPN_SERVERS to point to one node of the cluster. Authentication is not enabled in the example-infinispan CR.
Copy the benchmark into the pod, rsh to the pod and:
- updates nodes IP in the benchmark for the echo Clients
- updates conf/hotrod.properties to disable authentication `infinispan.client.hotrod.use_auth=false`

Run the test from the pod:
- bin/main.sh -c <benchmark filename>
- bin/worker.sh
- bin/worker.sh
- bin/worker.sh
- bin/worker.sh

If all ok a `results` folder will be generated

# Bare Metal Setup

Quicklab procedure:
1. https://quicklab.upshift.redhat.com/clusters new Cluster
2. Select template: generic
3. Select region: pick up one available
4. Days of reservation 7
5. enter a name and select 3 nodes
6. select flavor `quicklab.m1.large`
7. when provisioned select `base` bundle
8. select `rhsm` for the repos

3 Nodes: 8Gb , 4 CPU each
```
Cluster Information
Username: quicklab
Hosts:
node-3.vrigamongen0610.lab.pnq2.cee.redhat.com ( 10.74.182.252 )
node-0.vrigamongen0610.lab.pnq2.cee.redhat.com ( 10.74.182.152 )
node-1.vrigamongen0610.lab.pnq2.cee.redhat.com ( 10.74.181.158 )
node-2.vrigamongen0610.lab.pnq2.cee.redhat.com ( 10.74.180.101 )
```

# SCENARIO


OCP on Quicklab:  
1 master: 16Gb, 8 CPU  
3 workers: 8Gb , 4 CPU each  

Infinispan Data grid:
```
apiVersion: infinispan.org/v1
kind: Infinispan
metadata:
  name: example-infinispan
spec:
  container:
    cpu: 2000m
    extraJvmOpts: -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=9999
      -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false
      -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.rmi.port=9999
    memory: 4Gi
  replicas: 3
  security:
    endpointAuthentication: false
    endpointEncryption:
      clientCert: None
      type: None
  service:
    type: DataGrid
```

Infinispan Clients:  
radargun: 1 client in OCP cluster. [result](rg/html/index.html)  
hyperfoil: [benchmark](hf/hyperfoil-benchmark.yaml) [result](hf/hyperfoil-zulip-benchmark-results.html)

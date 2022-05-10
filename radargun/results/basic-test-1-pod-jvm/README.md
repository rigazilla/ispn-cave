# SCENARIO

[BasicOperationsTest](html/index.html)

OCP on Quicklab:
1 master: 16Gb, 8 CPU
2 workers: 8Gb , 4 CPU each

Infinispan Data grid:
```
apiVersion: infinispan.org/v1
kind: Infinispan
metadata:
  name: example-infinispan
spec:
  replicas: 1
  security:
    endpointEncryption:
      type: None
  container:
    extraJvmOpts: "-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=9999 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Djava.rmi.server.hostname=${MY_POD_IP} -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.rmi.port=9999 -Dcom.sun.management.jmxremote.host=${MY_POD_IP}"
```

Radargun setup
Infinispan Clients:
1 client in OCP cluster, no service involved.
1 echo worker.

Results
No JVM data from the echo worked only main and client values are shown.

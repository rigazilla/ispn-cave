# SCENARIO

[BasicOperationsTest](html/index.html)
[benchmark.xml](benchmark-hotrod-basic.xml)

OCP on Quicklab:
1 master: 16Gb, 8 CPU
2 workers: 8Gb , 4 CPU each

Infinispan Data grid:
```
piVersion: infinispan.org/v1
kind: Infinispan
metadata:
  name: example-infinispan
spec:
  replicas: 4
  security:
    endpointEncryption:
      type: None
```

Infinispan Clients:
1 client in OCP cluster, no service involved

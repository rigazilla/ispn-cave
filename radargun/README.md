# Radargun

In the conf directory there is a benchmark and a properties file to just run Radargun clients.
This setup leaves to the user the freedom to start the Infinispan cluster with whatever configuration he's interested.
Improvements are welcome.

## Helper scripts
- `scripts/build-radargun.sh` download and build radargun for Infinispan
- `scripts/build-image.sh` build an OCI image with radargun for Infinispan13

## Env vars
Define the following environment variable:
- `ISPN_USER` Infinispan username
- `ISPN_PASSWORD` Infinispan password
- `ISPN_SERVERS` Infinispan servers list (csv)

## Run Radargun client in a pod
Run:
```bash
envsub < k8s-config/deployment-radargun-client.yaml | oc apply -f -
```
`rsh` in the radargun pod and run the following:
```bash
./bin/main.sh -b conf/benchmark-hotrod-basic.yaml`
./bin/worker.sh
```

## Run Radargun in the local build
```bash
cp conf/* work/radargun/target/distribution/RadarGun-3.0.0-SNAPSHOT/conf
cd work/radargun/target/distribution/RadarGun-3.0.0-SNAPSHOT
bin/main.sh
bin/worker.sh
```

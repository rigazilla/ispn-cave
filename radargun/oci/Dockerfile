FROM registry.access.redhat.com/ubi8/openjdk-8-runtime
USER root
RUN microdnf --setopt=install_weak_deps=0 --setopt=tsflags=nodocs install -y procps-ng hostname fontconfig dejavu-sans-fonts vi
RUN fc-list
RUN useradd -ms /bin/bash radargun
WORKDIR /home/radargun
ADD work/radargun/target/distribution/RadarGun-3.0.0-SNAPSHOT/lib/ lib
ADD work/radargun/target/distribution/RadarGun-3.0.0-SNAPSHOT/plugins/infinispan130/ plugins/infinispan130
ADD work/radargun/target/distribution/RadarGun-3.0.0-SNAPSHOT/bin/ bin
ADD work/radargun/target/distribution/RadarGun-3.0.0-SNAPSHOT/conf/ conf
ADD work/radargun/target/distribution/RadarGun-3.0.0-SNAPSHOT/reporters/ reporters
ADD work/radargun/target/distribution/RadarGun-3.0.0-SNAPSHOT/schema/ schema
ADD conf/ conf
ADD scripts/clean-ps.sh bin
RUN chmod +x bin/clean-ps.sh
RUN chmod -R 777 /home/radargun
USER radargun

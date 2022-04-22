#!/bin/sh
OCICMD=${OCICMD:-podman}
$OCICMD build -f oci/Dockerfile -t radargun-client .

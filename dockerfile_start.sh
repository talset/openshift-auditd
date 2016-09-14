#!/bin/bash

docker build \
--no-cache \
--build-arg TEST=user \
-t docker.io/rcip/openshift-auditd:v1 \
.

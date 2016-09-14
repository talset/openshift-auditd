#!/bin/bash

#PROXY='-p PROXY=http://10.205.187.161:8888'

oc delete all --all; oc delete template --all

oc create -f openshift-auditd-template.yml
oc new-app --template=openshift-auditd
sleep 3
oc start-build openshift-auditd

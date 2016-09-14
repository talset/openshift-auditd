# openshift-auditd

== Setup Project
----
# oadm new-project testdaemonset
$ oc project testdaemonset
----

=== Set SCC
The rsyslog pods need to run privileged in order to access certain system resources.

* /etc/foo - read


As *system:admin* do the following:
----
# oadm policy add-scc-to-user privileged system:serviceaccount:testdaemonset:default
----


== Grant Daemonset ClusterRole
If you are using a different user than admin, you have to grant a daemonset clusterrole.

As Admin, create a dedicated cluster role:

```
cat <<EOF | oc create -f -
apiVersion: v1
kind: ClusterRole
metadata:
  name: daemonset-admin
rules:
- resources:
  - daemonsets
  apiGroups:
  - extensions
  verbs:
  - create
  - get
  - list
  - watch
  - delete
  - update
EOF
```

Grant the daemonset cluster role to your user
```
oadm policy add-role-to-user system:daemonset-admin system:serviceaccount:flo:default
```

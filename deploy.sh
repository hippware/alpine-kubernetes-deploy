#!/bin/sh
export REVISION=$CI_COMMIT_ID
export KUBECONFIG=k8s/kubeconfig

echo -n $TOKEN >> k8s/kubeconfig

kubernetes-deploy $NAMESPACE kube-context --template-dir=k8s

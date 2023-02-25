#!/bin/bash

. ./dev/scripts/env_vars.sh

# Activate the service account
gcloud auth activate-service-account $GCP_SERVICE_ACCOUNT_NAME --key-file=$GCP_SERVICE_ACCOUNT_KEYFILE

# Set GCP project (customer specific project/compartment)
echo N | gcloud config set project $GCP_PROJECT_ID 

# Create mgcp-host-crossplane-k8scluster on which crossplane will be installed
gcloud container clusters create $GKE_HOST_CLUSTER_NAME --zone $GKE_HOST_CLUSTER_ZONE --network=$GKE_HOST_CLUSTER_NETWORK --subnetwork=$GKE_HOST_CLUSTER_SUBNETWORK --num-nodes=$GKE_HOST_CLUSTER_MAX_NODE --no-enable-ip-alias

# Connect to cluster (also sets current context)
gcloud container clusters get-credentials $GKE_HOST_CLUSTER_NAME --zone $GKE_HOST_CLUSTER_ZONE --project $GCP_PROJECT_ID

# Install Crossplane
kubectl create namespace $CROSSPLANE_NS
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update
helm install crossplane --namespace $CROSSPLANE_NS crossplane-stable/crossplane --version $CROSSPLANE_VERSION

sleep 100
#### Install & configure the GCP provider on crossplane ####

# Install the GCP Provider on Crossplane
kubectl apply -f dev/crossplane/provider-gcp.yml
sleep 10

# Use envsubst to replace env var values in the provider-config YAML template file
envsubst \
    < dev/crossplane/provider-config-gcp.template.yml \
    > dev/crossplane/provider-config-gcp.yml

# Configure the GCP Provider
kubectl apply -f dev/crossplane/provider-config-gcp.yml

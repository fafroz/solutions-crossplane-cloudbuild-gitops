#!/bin/bash

. ./scripts/crossplaneHost_env_vars.sh

# Activate the service account
gcloud auth activate-service-account $GCP_SERVICE_ACCOUNT_NAME --key-file=$GCP_SERVICE_ACCOUNT_KEYFILE

# Set GCP project (customer specific project/compartment)
echo N | gcloud config set project $GCP_PROJECT_ID 

# Connect to mgcp-host-crossplane-k8scluster (also sets current context)
gcloud container clusters get-credentials $GKE_HOST_CLUSTER_NAME --zone $GKE_HOST_CLUSTER_ZONE --project $GCP_PROJECT_ID

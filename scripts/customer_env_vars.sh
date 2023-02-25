#!/bin/bash

# Set environement variables for Google Cloud

export GCP_PROJECT_ID="gitops-vittal"
export GCP_SERVICE_ACCOUNT_NAME="gitops-cloudbuild-gke@gitops-vittal.iam.gserviceaccount.com"
export GCP_SERVICE_ACCOUNT_KEYFILE="gcp_service_account_keyfile"
export BASE64ENCODED_GCP_PROVIDER_CREDS=$(base64 $GCP_SERVICE_ACCOUNT_KEYFILE | tr -d "\n") # base64 encode the GCP credentials

#customer Environment Variables
export GKE_CLUSTER_NAME="customer-gke-k8scluster1"
export GKE_CLUSTER_ZONE="us-central1-c"
export GKE_NETWORK="gitops-vpc"
export GKE_SUBNETWORK="gitops-subnet1"
export GKE_NODEPOOL="customer-gke-np"

# solutions-crossplane-cloudbuild-gitops

Manage infrastructure as code with crossplane and Cloud Build using the popular GitOps methodology.

## Pre-requisites

1. You have an existing Google Cloud project

2. You’ve created a Service Account in Google Cloud

3. You have an existing Kubernetes cluster up and running, since we’ll be installing Crossplane on that cluster.(We are providing script to provision host crossplane k8SCluster for the customer)

4. You have the envsubst command installed on your machine. (We are providing script to push image to container registry & use envsubst image)

5. Helm installed , minimum version v3.0.0+  (We are providing script to build , push Helm Image to container registry & use Helm image)


## Deployment
- clone Git repository
- edit/modify customer_env_vars.sh for particular customer
- prepare SA key (assumption is you have sufficient permissions)
- run the scripts

```
git clone git@github.com:fafroz/solutions-crossplane-cloudbuild-gitops.git
cd solutions-crossplane-cloudbuild-gitops

 
# Set up your environment variables(For your convenience, We have created a file called "customer_env_vars.sh" in the scripts folder.
# edit customer_env_vars.sh
vim customer_env_vars.sh

# prepare SA key
gcloud secrets versions access 1 --secret=gitops-solution --project=gitops-vittal > sa.json

# run the below scripts


## Configuring your dev environment 

## Promoting your environment to production

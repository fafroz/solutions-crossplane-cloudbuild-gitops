# solutions-crossplane-cloudbuild-gitops

Manage infrastructure as code with crossplane and Cloud Build using the popular GitOps methodology.

## Pre-requisites

1. You have an existing Google Cloud project

2. You’ve created a Service Account in Google Cloud

3. You have an existing Kubernetes cluster up and running, since we’ll be installing Crossplane on that cluster.(We are providing script to provision host crossplane k8SCluster for the customer)

4. You have the envsubst command installed on your machine. (We are providing script to push image to container registry & use envsubst image)

5. Helm installed , minimum version v3.0.0+  (We are providing script to build , push Helm Image to container registry & use Helm image)


## Steps :

1. **Clone the repo** (https://github.com/fafroz/crossplane-gitops.git)

2. **Set up your environment variables**
For your convenience, We ve created a file called **customer_env_vars.sh** in the scripts folder (/dev/scripts/customer_env_vars.sh):
Replace the values in <...> with your own as follows:

**<gcp_project_id>:** This is the name of our Google Cloud project.

**<gcp_service_account_name>:** The name of the service account for your Google Cloud project.

**<gcp_service_account_keyfile>:** This is the fully-qualified name of the JSON service account private key stored on your local machine. For example, /home/myuser/my-sa.json, if your file is located in the /home/myuser folder. Or my-sa.json if your file is located in your current working directory.

**Note:** This JSON private key is generated upon creation of the Service Account, to be sure to store it somewhere safe (and not in version control). Per Google’s docs on Service Account Keys, “After you download the key file, you cannot download it again.”

**<gke_cluster_name>:** Name of the Kubernetes cluster on Google cloud.

**<gke_cluster_zone>:** Name of the zone in which your Crossplane Kubernetes cluster resides.


## Configuring your dev environment 

## Promoting your environment to production


## Deployment
- clone Git repository
- edit/modify customer_env_vars.sh for particular customer
- prepare SA key (assumption is you have sufficient permissions)
- run the scripts

```
git clone git@github.com:fafroz/solutions-crossplane-cloudbuild-gitops.git
cd solutions-crossplane-cloudbuild-gitops

# edit customer_env_vars.sh
vim customer_env_vars.sh

# prepare SA key
gcloud secrets versions access 1 --secret=gitops-solution --project=gitops-vittal > sa.json

# run the below scripts

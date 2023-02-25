git clone https://github.com/GoogleCloudPlatform/cloud-builders-community.git
cd cloud-builders-community/helm
# build helm builder & push to conatiner registry
gcloud builds submit . --config=cloudbuild.yaml

cd ../..

# build envsubst builder & push to conatiner registry
cd cloud-builders-community/envsubst
gcloud builds submit . --config=cloudbuild.yaml

cd ../..
# remove cloud-builders-community
rm -rf cloud-builders-community

#!/bin/bash

. ./scripts/customer_env_vars.sh

# Use envsubst to replace env var values in the cluster-template YAML template file
envsubst \
    < templates/cluster-template.yml \
    > templates/cluster.yml

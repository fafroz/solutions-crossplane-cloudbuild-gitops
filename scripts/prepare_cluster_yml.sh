#!/bin/bash

. ./scripts/env_vars.sh

# Use envsubst to replace env var values in the cluster-template YAML template file
envsubst \
    < environments/dev/cluster-template.yml \
    > environments/dev/cluster.yml

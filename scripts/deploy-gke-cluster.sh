#!/bin/bash

. ./scripts/customer_env_vars.sh

kubectl apply -f environments/dev/cluster.yml

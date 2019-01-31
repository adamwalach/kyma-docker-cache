#!/bin/bash

set -eu

minikube ssh 

docker images --format "{{.Repository}}:{{.Tag}}"

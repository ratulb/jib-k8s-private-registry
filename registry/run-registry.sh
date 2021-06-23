#!/usr/bin/env bash

docker stop local-container-registry &>/dev/null
docker rm local-container-registry &>/dev/null

mkdir -p $HOME/registry/data
mkdir -p $HOME/registry/auth

#Run with auth - Need to create image pull secret
#docker run -v $HOME/registry/data:/data \
#	-v $HOME/registry/auth:/auth \
#	-e REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY=/data \
#	-e REGISTRY_AUTH_HTPASSWD_REALM='Registry Realm' \
#	-e REGISTRY_AUTH=htpasswd \
#	-e REGISTRY_AUTH_HTPASSWD_PATH=/auth/registry.password \
#	-p5000:5000 --name local-container-registry registry:2 &

#Run without auth
docker run -v $HOME/registry/data:/data \
	-p5000:5000 --name local-container-registry registry:2 &
echo "Local container registry starting at port 5000"

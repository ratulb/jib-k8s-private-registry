#!/usr/bin/env bash

kubectl delete -f local-image.yaml &>/dev/null

. registry/run-registry.sh

#Password secured
#mvn compile jib:build -Djib.to.image=localhost:5000/local-image\
#       -Djib.to.auth.username=test -Djib.to.auth.password=test \
#       -Djib.allowInsecureRegistries=true -DsendCredentialsOverHttp=true

#Unsecured
mvn compile jib:build -Djib.allowInsecureRegistries=true
sleep 2

kubectl apply -f local-image.yaml
sleep 2

kubectl delete svc local-image-service
sleep 2

kubectl expose pod local-image --type NodePort --port 8080 --target-port 8080 --name local-image-service
sleep 2

kubectl get svc
sleep 2

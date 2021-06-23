# jib-k8s-private-registry
Work around for avoiding docker hub pull restriction limit while developing and testing an image in local k8s cluster. Develop container image using jib(https://github.com/GoogleContainerTools/jib), push it to a private registry and pull the image from kubernetes cluster.

Requiremnts: kubectl in path and is able to talk to local kubernetes cluster

run ./build.sh and local-image-service(NodePort) - will be up in a matter of seconds.



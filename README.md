# SimpleCD

SimpleCD (aka simple continuous delivery) is a cloned application for current CD tools like ArgoCD, Jenkins, and Flux. It is being used to deploy applications on Kubernetes cluster.
It can be installed on Kubernetes clusters or any local machines. I call it SimpleCD because it's logic is so basic and simple. First you give your desired repositories as a source, then, as a destination you need to specify a Namespace. Moreover, if you want to deploy SimpleCD on a Kubernetes cluster, you have to create a serviceAccount with cluster-admin role provided. On the other hand, if you are running SimpleCD on a local machine, make sure to specify the kubernetes API server address and a authentication token with cluster-admin role.

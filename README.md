# SimpleCD

SimpleCD (aka simple continuous delivery) is a cloned application for current CD tools like ArgoCD, Jenkins, and Flux. It is being used to deploy applications on Kubernetes cluster.
It can be installed on Kubernetes clusters or any local machines. I call it SimpleCD because it's logic is so basic and simple. First you give your desired repositories as a source, then, as a destination you need to specify a Namespace. Moreover, if you want to deploy SimpleCD on a Kubernetes cluster, you have to create a serviceAccount with cluster-admin role provided. On the other hand, if you are running SimpleCD on a local machine, make sure to specify the kubernetes API server address and a authentication token with cluster-admin role.

Each instance of `simple-cd`, get the information of a git repository, and the credentials needed to communicate with a Kubernetes API. Then, it will run a git command to see if the upstream has changed or not. If so, it will pull the changes and apply them to the Kubernetes API.

## Running on Kubernetes

```yml
apiVersion: v1
kind: Pod
metadata:
  name: simple-cd
spec:
  initContainers:
  - name: git-clone
    env:
    - name: RIPO
      value: "https://github.com/repo.git"
    image: alpine/git
    command:
      - /bin/sh
      - -c
      - |
        git clone "$RIPO" /data/repo
    volumeMounts:
      - name: git-volume
        mountPath: /data
  containers:
  - image: ghcr.io/amirhnajafiz/simple-cd:v0.0.1
    env:
    - name: SCD_KUBE_TOKEN
      valueFrom:
        secretKeyRef:
          name: default-token
          key: token
    - name: SCD_KUBE_NS
      valueFrom:
        fieldRef:
          fieldPath: metadata.namespace
    - name: SCD_KUBE_API
      value: "https://$(KUBERNETES_SERVICE_HOST):$(KUBERNETES_SERVICE_PORT)"
    volumeMounts:
    - name: service-account-token
      mountPath: /var/run/secrets/kubernetes.io/serviceaccount
      readOnly: true
    - name: git-volume
      mountPath: /app/repo
  volumes:
  - name: git-volume
    emptyDir: {}
  - name: service-account-token
    secret:
      secretName: default-token  # This secret contains the service account token
```

# ML pipeline

## Overview

This repository contains the code for a machine learning pipeline (preprocessing and training) that is encapsulated in two docker containers. The pipeline is deployed on a Kubernetes cluster using Argo Workflows. Also a cloud deployment strategy on preemptible VMs is provided.

## Requirements

- Docker
- Kubernetes
- Argo Workflows

## Getting Started

### 1. Clone the repository

```bash
git clone git@github.com:Bfault/simple-ml-pipeline.git
cd simple-ml-pipeline
```

### 2. Install Argo Workflows

```bash
kubectl create namespace argo
kubectl apply -n argo -f https://github.com/argoproj/argo-workflows/releases/latest/download/install.yaml
```

### 2'. Install Argo Workflows CLI

```bash
curl -sLO https://github.com/argoproj/argo-workflows/releases/latest/download/argo-linux-amd64.gz
gunzip argo-linux-amd64.gz
chmod +x argo-linux-amd64
sudo mv ./argo-linux-amd64 /usr/local/bin/argo
```

### 3. Submit the workflow

```bash
argo submit workflow.yaml
```

## Monitoring (Argo GUI)

```bash
kubectl -n argo port-forward deployment/argo-server 2746:2746
```

then go on http://localhost:2746

## Possible improvements

- Use local image then send it to the pod instead of using a registy.
- The workflow could be more complex (e.g. using input/output instead of volumes, use of parameters).
- The cloud deployment strategy.
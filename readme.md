# Kubernetes Playground

A local environment for testing Kubernetes configurations, Helm charts, and Ingress setups using Kind (Kubernetes in Docker).

## Prerequisites

- Docker
- Kind
- Kubectl
- Helm

## Quick Start

### Create a new cluster

```bash
make create
```

### Install Ingress Controller

```bash
make helm-install
```

### Deploy sample applications

```bash
make apply
```

### Test the ingress

1. Add to your `/etc/hosts`:
```bash
echo "127.0.0.1 local.test" | sudo tee -a /etc/hosts 
```

```
127.0.0.1 local.test
```

2. Test the endpoint:
```bash
curl -H "Host: local.test" http://localhost/
```

### Clean up

To delete the cluster and clean up resources:

```bash
make clean
```

## Available Make Commands

- `make create` - Creates a new Kind cluster
- `make clean` - Deletes the cluster and cleanup resources
- `make helm-install` - Installs the nginx-ingress controller
- `make helm-upgrade` - Upgrades the nginx-ingress controller
- `make apply` - Applies the sample k8s manifests

## Project Structure

```
.
├── Cluster.yaml          # Kind cluster configuration
├── helms/               
│   └── ingress-nginx/    # Nginx ingress controller helm values
├── k8s-manifests/        # Kubernetes manifest files
│   └── sample.yaml       # Sample application manifests
└── makefile             # Automation commands
```


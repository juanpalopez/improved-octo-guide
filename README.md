# Devo App Infrastructure

This repository contains the infrastructu and charts to be deployed as part of the Devo App

## Requirements

* awscli
* kubectl
* helm
* terraform



### Infrastructure

The main resources included are:

* VPC, private and public subnets
* IAM Roles
* EKS Cluster
* EC2 Instances

### Charts

The Helm charts included are:

* Rabbit MQ
* Devo App

## Deployment

Make sure to export AWS_PROFILE to define the credentials to use, else it will use default profile

To provision the infrastructure:

```bash
    $> cd iac/
    $> terraform init

    # To check what resources is going to be deployed
    $> terraform plan

    # To deploy the resources with default values
    $> terraform apply 

    # To deploy the resources with a specific environment variables
    $> terraform apply -var-file=<ENVIRONMENT>.tfvars

    $> cd ..
```

To configure kubectl
```bash
    $> aws eks --region eu-west-1 update-kubeconfig --name eks_cluster
```

To deploy the helm charts:

```bash
    $> cd k8s/

    # Deploy Rabbit MQ with 3 replicas
    $> helm install rabbitmq ./rabbitmq-chart --set replicaCount=3

    # Deploy Devo App with 3 replicas
    $> helm install devo-test ./devo-test-chart  --set profiles=production,replicaCount=3

```

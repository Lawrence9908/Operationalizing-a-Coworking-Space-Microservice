# Operationalizing a Coworking Space Microservice


## Project Overview: Coworking Space Service

The Coworking Space Service is a set of APIs that enables users to request one-time tokens and administrators to authorize access to a coworking space. This service follows a microservice pattern and the APIs are split into distinct services that can be deployed and managed independently of one another. For this project, you are a DevOps engineer who will be collaborating with a team that is building an API for business analysts. The API provides business analysts with basic analytics data on user activity in the coworking space service. The application they provide you functions as expected, and you will help build a pipeline to deploy it to Kubernetes. You'll submit artefacts from the build and deployment of this service.

## Step 1: Set Up a Postgres Database with Helm Chart
Pre-requisites:
- Have Kubernetes cluster ready.
- Have `kubectl` installed and configured to interact with your cluster.
- Have Helm installed.

Instructions:
1. Install Helm:
   ```bash
   curl -LO https://get.helm.sh/helm-v3.12.2-linux-amd64.tar.gz
   ```
2. Add the Bitnami Helm Repository:
    ```bash
   helm repo add bitnami https://charts.bitnami.com/bitnami
   helm repo update
   ```
3. Install the PostgreSQL Chart:
   ```bash
   helm install my-postgres bitnami/postgresql
   ```
4. Verify the Installation:
   ```bash
   helm list
   kubectl get pods
   ```
5. Get the PostgreSQL Connection Details:
   ```bash
   export POSTGRES_PASSWORD=$(kubectl get secret --namespace default my-postgres-postgresql -o jsonpath="{.data.postgres-password}" | base64 --decode)
   ```

## Create a Dockerfile for the Python Application
Dockerfile
[Dockerfile](./Dockerfile)

## Write a Build Pipeline with AWS CodeBuild

buildspec File
[buildspec](./buildspec.yml)

BulidCode
<img src="./screenshots/3 (a) AWS CodeBuild pipeline.png">

## Create Kubernetes Service and Deployment
1. List Services
   ```bash
   kubectl get svc
   kubectl describe svc
   ```
  

3. List Pods
   ```bash
   kubectl get pods
   kubectl describe pods
   ```
   
4. List Deployments
   ```bash
   kubectl get deployments
   kubectl describe deployment project3-api
   ```



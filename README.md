
# shortler-assessment

# Project Documentation: REST API for Current Time

## Project Overview
This project involves the development and deployment of a simple REST API that returns the current time when a GET request is made to the `/current-time` endpoint. The REST API is deployed in a private Google Kubernetes Engine (GKE) cluster, with public access provided through the external IP of a jump server. The infrastructure, including the GKE cluster, networking, and container registry, is managed using Terraform. The project also includes a CI/CD pipeline to automate the deployment process.

## Folder Structure

The project is organized into the following directories:

- **`Infra/`**: Contains Terraform modules for infrastructure components such as VPC, subnets, GKE, and image registry.
  - **`vpc/`**: Defines the Virtual Private Cloud (VPC) and associated subnets.
  - **`subnets/`**: Configures subnets within the VPC.
  - **`GKE/`**: Manages the creation and configuration of the GKE cluster.
  - **`image_registry/`**: Handles the setup of the container image registry in Google Artifact Registry.

- **`simple-rest-api/`**: Contains the code for the REST API.
  - **`Dockerfile`**: Defines the Docker image for the REST API.

- **`workloads/`**: Contains Kubernetes manifests and Terraform code for deploying the REST API in the GKE cluster.

## REST API Details

- **Endpoint**: `/current-time`
- **HTTP Method**: GET
- **Response**: Returns the current server time in JSON format.

## Infrastructure Details

- **GKE Cluster**: The REST API is deployed in a private GKE cluster. Public access to the API is provided through the external IP address of a jump server.
- **VPC and Subnets**: The GKE cluster and other resources are hosted in a custom VPC with multiple subnets, configured using Terraform.
- **Container Registry**: The Docker image for the REST API is stored in Google Artifact Registry.

## CI/CD Pipeline

The CI/CD pipeline is defined to automate the deployment process. It consists of three main jobs:

1. **Infra Job**:
   - Deploys the entire infrastructure, including the VPC, subnets, GKE cluster, and image registry using Terraform. The image registry url is returned as an output variable **image_registry_url** after deploying the infrastructure.
  
2. **Image Job**:
   - Builds the Docker image for the REST API and pushes it to Google Artifact Registry.

3. **Workload Job**:
   - Deploys the REST API to the GKE cluster using the Kubernetes manifests defined in the `workloads/` folder.

## Local Deployment Steps

1. **Set up the Infrastructure**:
   - Navigate to the `Infra/` directory.
   - configure a new remote backend or disable it to use local backend
   - navigate to the **terraform.auto.tfvars** file and set this field **jump_server_ip** to your PC's public IP address. This allows you to make api calls to the cluster as its a private cluster.
   - Then run the terraform script to create the VPC, subnets, GKE cluster, and image registry.

2. **Build and Push the Docker Image**:
   - Navigate to the `simple-rest-api/` directory.
   - Build the Docker image using the provided `Dockerfile`.
   - Make sure you tag the image accordingly using the **image_registry_url**.
   - The **image_registry_url** will be returned to you as an output variable after a successful run of the terraform script in the **infra** folder.
   - Push the image to Google Artifact Registry.

3. **Deploy the REST API**:
   - Navigate to the `workloads/` directory.
   - Navigate to the **terraform.auto.tfvars** file, update the **image** field accordingly.
   - Also configure your remote backend or disable it to use local backend
   - Apply the Terraform configurations to deploy the REST API on the GKE cluster.

## Accessing the REST API

Once deployed, the REST API can be accessed via the external IP address of the jump server. Ensure that the necessary network permissions are configured to allow traffic from the jump server to the GKE cluster.

## Conclusion

This project demonstrates a complete workflow for developing, containerizing, and deploying a REST API in a private GKE cluster using Terraform. The CI/CD pipeline automates the entire process, from infrastructure provisioning to workload deployment.
















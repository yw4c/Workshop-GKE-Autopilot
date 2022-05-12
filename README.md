# Workshop: GKE Autopilot Cluster
For this part, we will create a private cluster in autopilot mode by terraform.
* Goals
  * Static IP for ingress
  * Static IP for egress
    
* This workshop will generate following cost.
  
  |-|spec|Price/Month|Use|
  |---|---|---|---|
  |Autopilot|spot POD*1|[From $3](https://cloud.google.com/kubernetes-engine/pricing#autopilot_mode)|
  |LoadBalance|*1|
  |NAT|*1|
---
## Required tools
|tool|refer version|
|---|---|
|[terraform](https://www.terraform.io/downloads)|v1.1.9| 
|[gcloud](https://cloud.google.com/sdk/docs/install)| 384.0.1 |

## About Autopilot
1. Compare with standard

   |-|Autopilot|Standard|
   |---|---|---|
   |Billing|Pay per Pod resource requests (CPU, memory, and ephemeral storage)|Pay per node (CPU, memory, boot disk)|
   |Scaling|Pre-configured: Autopilot handles all the scaling and configuring of your nodes.| configure node autoscaling.|
   
   [refer link](https://cloud.google.com/kubernetes-engine/docs/concepts/autopilot-overview)

1. Use spot pods (like spot VM in GCE) for lower costs
   * Pods have to deploy on spot nodes
   ```yaml
   ...
   nodeSelector:
     cloud.google.com/gke-spot: "true"
   terminationGracePeriodSeconds: 25
   ```
   [refer link](https://cloud.google.com/kubernetes-engine/docs/how-to/autopilot-spot-pods)

## Steps
1. Enable GCP APIs
   ```shell
    gcloud services enable container.googleapis.com
   ```
1. Service account for terraform.
   1. [Create GCP IAM service account](https://cloud.google.com/iam/docs/creating-managing-service-accounts#creating)
   1. Grant service account permission. 
   1. Download the JSON keygen, put it in ```gke/credentials/```
   
1. Terraform: modify cluster project variable in ```my-gcp-project/variables.tf```
   
   * project_id: Copy project_id from GCP credential file
   * credential_json: File path in ```gke/credentials/```
   * master_authorized_networks: Change into the whitelist conducting kubectl. 
   
1. Launch cluster by terraform
   ```shell
   cd my-gcp-project/
   terraform init && terraform plan
   terraform apply
   ```
   
1. Load GKE context in kube-config file
   ```shell
   gcloud container clusters get-credentials my-cluster-01 --region us-central1
   kubectl get ns
   ```

1. 
```shell
kubectl apply -f cluster-tools.yaml 
```
## Reference
* [terraform module of auto-pilot](https://github.com/terraform-google-modules/terraform-google-kubernetes-engine/tree/master/modules/beta-autopilot-private-cluster) 
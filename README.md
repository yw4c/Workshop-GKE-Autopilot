# Create GKE private cluster
For this part, we will create a private cluster in autopilot mode by terraform.

---
## Concept
1. GKE Autopilot mode

   |-|Autopilot|Standard|
   |---|---|---|
   |Billing|Pay per Pod resource requests (CPU, memory, and ephemeral storage)|Pay per node (CPU, memory, boot disk)|
   |Scaling|Pre-configured: Autopilot handles all the scaling and configuring of your nodes.| configure node autoscaling.|
   
   refer: https://cloud.google.com/kubernetes-engine/docs/concepts/autopilot-overview

## Workshop
1. Service account for terraform.
   1. [Create GCP IAM service account](https://cloud.google.com/iam/docs/creating-managing-service-accounts#creating)
   1. Download the JSON keygen, put it in ```gke/credentials/```
   
1. Enable GCP APIs
   * Kubernetes Engine APIs
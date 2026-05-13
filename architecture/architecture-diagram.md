# 501 Fun Azure Architecture Diagram

```txt
                        ┌──────────────────────────┐
                        │      GitHub Actions      │
                        │ Terraform / App Deploy   │
                        │ Security Scan Pipelines  │
                        └────────────┬─────────────┘
                                     │
                                     ▼
                        ┌──────────────────────────┐
                        │   Azure Resource Group   │
                        │     rg-501fun-prod       │
                        └────────────┬─────────────┘
                                     │
         ┌───────────────────────────┼────────────────────────────┐
         ▼                           ▼                            ▼
┌────────────────┐      ┌─────────────────────────┐     ┌────────────────────┐
│ Azure Key Vault │      │ Azure API Management    │     │ Azure Monitoring    │
│ Secrets / Certs │      │ Secure API Gateway      │     │ Logs + Insights     │
└────────────────┘      └─────────────────────────┘     └────────────────────┘
         │                           │                            │
         ▼                           ▼                            ▼
┌──────────────────────────────────────────────────────────────────────────────┐
│                            Virtual Network                                  │
│                                                                          │
│  ┌──────────────┐   ┌─────────────────┐   ┌──────────────────────────┐   │
│  │ AKS Subnet    │   │ App Subnet       │   │ Data Subnet               │   │
│  │ Private AKS   │   │ Container Apps   │   │ Storage / Messaging       │   │
│  └──────┬───────┘   └────────┬────────┘   └────────────┬─────────────┘   │
│         │                    │                           │                 │
│         ▼                    ▼                           ▼                 │
│ ┌──────────────┐   ┌────────────────┐      ┌─────────────────────────┐    │
│ │ AKS Cluster   │   │ Container App   │      │ Azure Storage Account   │    │
│ │ Backend APIs  │   │ Central Config  │      │ Raw + Processed Videos  │    │
│ └──────┬───────┘   └────────────────┘      └────────────┬────────────┘    │
│        │                                                 │                 │
│        ▼                                                 ▼                 │
│ ┌────────────────────┐                   ┌──────────────────────────────┐  │
│ │ Azure Container     │                   │ Storage Queue                │  │
│ │ Registry (ACR)      │                   │ Video Processing Jobs        │  │
│ └────────────────────┘                   └──────────────────────────────┘  │
│                                                                          │
└──────────────────────────────────────────────────────────────────────────────┘
                                     │
                                     ▼
                   ┌────────────────────────────────────┐
                   │ Messaging & Event Processing       │
                   │                                    │
                   │ Azure Service Bus                  │
                   │ Azure Event Hub                    │
                   │ Azure Communication Services       │
                   └────────────────────────────────────┘
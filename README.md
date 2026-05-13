# 501 Fun DevOps Technical Assessment

## Overview

This project delivers an enterprise-grade Azure cloud platform for 501 Fun, designed to support multi-venue gaming operations at production scale.

The architecture supports:

- Centralised configuration management
- Venue telemetry ingestion
- Device event processing
- Video capture and processing pipelines
- Guest SMS communication
- Secure API gateway
- Scalable containerised applications
- Infrastructure as Code
- Enterprise security controls
- Full CI/CD automation
- Monitoring and observability
- Future expansion readiness

---

## Architecture Summary

### Core Platform Components

#### Networking
- Azure Virtual Network
- Segmented subnets:
  - AKS
  - Application
  - Data
- Network Security Groups
- Private AKS cluster
- Restricted Key Vault ACLs

#### Compute
- Azure Kubernetes Service (AKS)
- Azure Container Apps
- Azure Container Registry (ACR)

#### Security
- Azure Key Vault
- RBAC
- OIDC Workload Identity
- Private Cluster Design
- API Management
- Security Scanning via tfsec + Trivy

#### Messaging
- Azure Service Bus
- Azure Event Hub

#### Storage
- Azure Blob Storage
- Raw Video Storage
- Processed Video Storage
- Processing Queue

#### Communication
- Azure Communication Services (SMS-ready)

#### Monitoring
- Log Analytics Workspace
- Application Insights

#### CI/CD
- GitHub Actions:
  - `terraform.yml`
  - `app-deploy.yml`
  - `security-scan.yml`

---

## Repository Structure

```txt
501-fun-devops-task/
│
├── .github/workflows/
│   ├── terraform.yml
│   ├── app-deploy.yml
│   └── security-scan.yml
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── providers.tf
│   ├── modules/
│   └── terraform.tfvars
│
├── docs/
│   ├── security.md
│   ├── scaling.md
│   └── ci-cd.md
│
├── architecture/
│   └── architecture-diagram.png
│
└── README.md
```

## Security Design

### Implemented Controls

#### Infrastructure Security
- Private AKS cluster
- Azure Policy enabled
- Key Vault network ACL restrictions
- Storage account controlled access
- Secure Terraform remote backend
- Managed identities
- RBAC least privilege

#### Pipeline Security
- GitHub secret management
- Terraform validation
- tfsec scanning
- Trivy vulnerability scanning
- Remote state isolation

#### Secrets Protection
- No secrets stored in Git
- Terraform state remote secured
- GitHub push protection compliance

---

## Scalability Strategy

### Horizontal Scale
- AKS node autoscaling
- Container App scaling
- Service Bus partitioning
- Event Hub throughput scaling
- Blob storage scalability

### Multi-Region Readiness

#### Future improvements:
- Global Traffic Manager
- Multi-region failover
- Geo-redundant storage
- Distributed Event Hub architecture
- Cloudflare edge caching

---

## Reliability & Resilience

### Designed For:
- High availability
- Fault isolation
- Disaster recovery
- Event replay
- Queue durability
- Central config redundancy
- Monitoring and alerting

---

## Monitoring & Observability

### Tools:
- Azure Monitor
- Log Analytics
- Application Insights

### Coverage:
- Cluster health
- App telemetry
- API performance
- Queue monitoring
- Event ingestion
- Deployment diagnostics

---

## Cost Optimisation

### Current Approach:
- Standard tier balancing
- Container Apps for lightweight services
- Managed services where possible
- Queue/event architecture for async efficiency
- Shared storage
- Modular IaC

### Future Optimisations:
- Spot nodes
- Reserved instances
- Autoscaling improvements
- Storage lifecycle policies
- FinOps dashboards

---

## Trade-offs & Assumptions

### Trade-offs:
- Container Apps chosen over App Service due to quota constraints
- Simpler video processing using storage queues vs full media pipeline
- Single-region deployment for assessment practicality
- Security prioritised over public accessibility
- Terraform modularity over speed

### Assumptions:
- UK South as primary deployment region
- Azure-first enterprise strategy
- GitHub as CI/CD platform
- Cloudflare for future edge integration
- Production workloads will expand over time

---

## CI/CD Pipeline

### Terraform Deployment
- Validate
- Format
- Plan
- Apply

### Security
- tfsec
- Trivy

### Application Deployment
- Docker build
- ACR push
- AKS deployment
- Container App deployment

### Manual Deployment Support
- `workflow_dispatch` enabled

---

## Deployment Instructions

### Local Deployment
```bash
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

### GitHub Actions
- Configure Azure credentials
- Configure remote backend
- Push to `main`
- Manual dispatch supported

---

## Future Enhancements

- Cloudflare WAF + CDN
- Azure Front Door
- Dedicated FFmpeg processing cluster
- Multi-region architecture
- DR automation
- Blue/Green deployments
- Chaos engineering
- Compliance auditing
- FinOps optimisation
- AI-driven observability

---

## Technical Strengths Demonstrated

- Azure architecture
- Kubernetes
- Terraform modular IaC
- DevSecOps
- CI/CD automation
- Security engineering
- Messaging systems
- Monitoring
- Production design thinking
- Enterprise operational maturity

---

## Conclusion

This solution provides a production-grade DevOps architecture aligned with enterprise standards while balancing:

- Security
- Scalability
- Reliability
- Cost
- Maintainability
- Operational efficiency

The platform is designed not just to meet current technical requirements, but to serve as a scalable foundation for future global gaming infrastructure expansion.
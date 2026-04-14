\# 🚀 Terraform Azure Infrastructure



\## 📌 Overview

This project demonstrates \*\*Infrastructure as Code (IaC)\*\* using Terraform to provision and manage Azure resources.



It follows a \*\*modular architecture\*\* and includes real-world practices like \*\*brownfield resource import\*\*.



\---



\## 🧱 Architecture



Resources managed in this project:



\- Resource Group

\- Network Security Group (NSG)

\- Virtual Machine (Linux)

\- Azure Key Vault

\- Storage Account

\- Application Insights

\- App Service (with deployment slots)



\---



\## ⚙️ Tech Stack



\- Terraform

\- Microsoft Azure

\- Azure CLI



\---



\## 📁 Project Structure


---

## 🔐 Security Best Practices

- No secrets stored in code
- `.tfvars` files excluded via `.gitignore`
- Supports Azure Key Vault integration

---

## 🔄 Brownfield Approach

This project demonstrates how to:

- Import existing Azure resources into Terraform
- Align Terraform state with live infrastructure
- Avoid resource recreation (critical in production)

---

## 🚀 How to Use

### 1. Clone repo
```bash
git clone https://github.com/raees-irfan/terraform-azure-infra.git
cd terraform-azure-infra/environments/nonprod


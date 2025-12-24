# Oracle Cloud Infrastructure - Hub and Spoke Network Architecture

Cette configuration Terraform déploie une architecture réseau Hub and Spoke sur Oracle Cloud Infrastructure (OCI) optimisée pour héberger des clusters OKE (Oracle Kubernetes Engine).

## Architecture

### Vue d'ensemble

L'architecture comprend :

- **1 Hub VCN** (10.0.0.0/20) - Réseau central avec services partagés
- **3 Spoke VCNs** - Réseaux satellites pour les environnements :
  - **core-dev** (10.1.0.0/20) - Environnement de développement
  - **core-staging** (10.2.0.0/20) - Environnement de staging
  - **core-prod** (10.3.0.0/20) - Environnement de production
- **Dynamic Routing Gateway (DRG)** - Point d'interconnexion central entre le hub et les spokes

### Topologie Réseau

```
                          ┌─────────────────┐
                          │   Internet      │
                          └────────┬────────┘
                                   │
                          ┌────────▼────────┐
                          │  Hub VCN        │
                          │  10.0.0.0/20    │
                          │                 │
                          │  - IGW          │
                          │  - NAT GW       │
                          │  - Service GW   │
                          └────────┬────────┘
                                   │
                          ┌────────▼────────┐
                          │      DRG        │
                          │   (Central)     │
                          └─────┬─┬─┬───────┘
                     ┌──────────┘ │ └──────────-┐
                     │            │             │
            ┌────────▼──────┐ ┌─-─▼──────-─┐ ┌-─▼─────-────┐
            │  Spoke Dev    │ │  Spoke     │ │  Spoke      │
            │  10.1.0.0/20  │ │  Staging   │ │  Prod       │
            │               │ │ 10.2.0.0/20│ │ 10.3.0.0/20 │
            │  OKE Cluster  │ │            │ │             │
            │  - API        │ │ OKE        │ │ OKE         │
            │  - Nodes      │ │ Cluster    │ │ Cluster     │
            │  - LB         │ │            │ │             │
            └───────────────┘ └───────────-┘ └───────────-─┘
```

## Composants Réseau

### Hub VCN (10.0.0.0/20)

Le Hub contient les services partagés et les gateways centralisés :

- **Subnets** :
  - `subnet-hub-shared` (10.0.0.0/24) - Services partagés privés
  - `subnet-hub-public` (10.0.1.0/24) - Services publics

- **Gateways** :
  - Internet Gateway - Accès sortant et entrant vers Internet
  - NAT Gateway - Accès sortant pour les ressources privées
  - Service Gateway - Accès aux services OCI (Object Storage, etc.)

### Spoke VCNs - Configuration OKE

Chaque spoke (dev, staging, prod) contient 3 subnets pour OKE :

1. **OKE API Endpoint Subnet** (x.x.0.0/28)
   - Héberge l'endpoint de l'API Kubernetes
   - Privé (pas d'IP publiques)

2. **OKE Worker Nodes Subnet** (x.x.1.0/24)
   - Héberge les worker nodes du cluster OKE
   - Privé (pas d'IP publiques)
   - Accès Internet via NAT Gateway

3. **OKE Load Balancer Subnet** (x.x.2.0/24)
   - Héberge les Load Balancers pour les services Kubernetes
   - Public (IP publiques autorisées)
   - Accès direct à Internet via Internet Gateway

### Dynamic Routing Gateway (DRG)

Le DRG connecte tous les VCNs et gère le routage inter-VCN :

- **DRG Attachments** - Un attachment par VCN (hub + 3 spokes)
- **DRG Route Tables** :
  - `DRG-RT-HUB` - Table de routage pour le hub
  - `DRG-RT-SPOKE` - Table de routage pour les spokes
- **DRG Route Distributions** - Import automatique des routes des spokes

## Security Lists

### Hub Security Lists

- **HUB-SL-SHARED** : Autorise le trafic depuis tous les Spokes (10.0.0.0/8)
- **HUB-SL-PUBLIC** : Autorise HTTPS (443) depuis Internet

### Spoke Security Lists

Pour chaque spoke (dev, staging, prod) :

- **SPOKE-X-SL-PRIVATE** :
  - Autorise tout le trafic depuis le VCN local
  - Autorise tout le trafic depuis le Hub

- **SPOKE-X-SL-PUBLIC** :
  - Autorise HTTP (80) et HTTPS (443) depuis Internet
  - Pour les Load Balancers publics

## Routage

### Hub Routing

- **RT-HUB-SHARED** :
  - Internet via NAT Gateway (0.0.0.0/0)
  - Spokes via DRG (10.1.0.0/16)

- **RT-HUB-PUBLIC** :
  - Internet via Internet Gateway (0.0.0.0/0)

### Spoke Routing

Pour chaque spoke :

- **RT-SPOKE-X-PRIVATE** :
  - Hub via DRG (10.0.0.0/20)
  - Autres Spokes via DRG
  - Internet via NAT Gateway local (0.0.0.0/0)

- **RT-SPOKE-X-PUBLIC** :
  - Internet via Internet Gateway local (0.0.0.0/0)

## Prérequis

1. **Compartments OCI** : Les compartments suivants doivent exister :
   - Hub compartment
   - Core-dev compartment
   - Core-staging compartment
   - Core-prod compartment

2. **Provider Configuration** :
   - Credentials OCI configurées
   - Region OCI définie

## Utilisation

### 1. Configuration

Éditez le fichier `shared.auto.tfvars` avec vos valeurs OCI :

```hcl
# Provider Configuration
tenancy_ocid = "ocid1.tenancy.oc1..xxxx"
user_ocid    = "ocid1.user.oc1..xxxx"
fingerprint  = "xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx:xx"
private_key  = "~/.oci/oci_api_key.pem"
region       = "eu-paris-1"

# Compartment IDs
hub_compartment_id          = "ocid1.compartment.oc1..xxxx"
compartment_core_dev_id     = "ocid1.compartment.oc1..xxxx"
compartment_core_staging_id = "ocid1.compartment.oc1..xxxx"
compartment_core_prod_id    = "ocid1.compartment.oc1..xxxx"

# Common Tags
freeform_tags = {
  made-by     = "terraform"
  project     = "portefaix"
  environment = "shared"
  service     = "networking"
}
```

**Note**: Le fichier `shared.auto.tfvars` est automatiquement chargé par Terraform (grâce au suffixe `.auto.tfvars`).

### 2. Initialisation

```bash
terraform init
```

### 3. Plan

```bash
terraform plan
```

### 4. Déploiement

```bash
terraform apply
```

## Outputs

Après le déploiement, les outputs suivants sont disponibles :

### VCN IDs

- `hub_vcn_id` - ID du VCN Hub
- `spoke_dev_vcn_id` - ID du VCN Dev
- `spoke_staging_vcn_id` - ID du VCN Staging
- `spoke_prod_vcn_id` - ID du VCN Prod

### DRG ID

- `drg_id` - ID du Dynamic Routing Gateway

### Subnet IDs pour OKE

Pour chaque environnement (dev, staging, prod) :

- `{env}_oke_api_subnet_id` - Subnet pour l'API Kubernetes
- `{env}_oke_nodes_subnet_id` - Subnet pour les worker nodes
- `{env}_oke_lb_subnet_id` - Subnet pour les Load Balancers

### Network Summary

- `network_summary` - Résumé complet de l'architecture réseau

## Exemple d'utilisation des outputs pour OKE

Pour déployer un cluster OKE dans l'environnement dev :

```hcl
module "oke_dev" {
  source = "..."

  vcn_id              = module.hub_spoke_network.spoke_dev_vcn_id
  api_endpoint_subnet = module.hub_spoke_network.dev_oke_api_subnet_id
  node_subnet         = module.hub_spoke_network.dev_oke_nodes_subnet_id
  lb_subnet           = module.hub_spoke_network.dev_oke_lb_subnet_id
}
```

## Sécurité

### Bonnes Pratiques Implémentées

1. **Isolation réseau** : Chaque environnement (dev, staging, prod) est isolé dans son propre VCN
2. **Subnets privés** : Les worker nodes et API endpoints sont dans des subnets privés
3. **NAT Gateway** : Les ressources privées accèdent à Internet via NAT Gateway
4. **Security Lists** : Règles de sécurité strictes par défaut
5. **DRG centralisé** : Contrôle du trafic inter-VCN via le DRG

### Recommandations Supplémentaires

- Utilisez des Network Security Groups (NSG) pour un contrôle plus granulaire
- Implémentez un Network Firewall dans le Hub pour l'inspection du trafic
- Activez les logs de flux (Flow Logs) pour l'audit et le monitoring
- Considérez l'utilisation de Private Endpoints pour les services OCI

## Module Utilisé

Cette configuration utilise le module officiel OCI Landing Zones :

- **Module** : [terraform-oci-modules-networking](https://github.com/oci-landing-zones/terraform-oci-modules-networking)
- **Version** : v0.7.8

## Licence

Apache License 2.0 - Voir LICENSE pour plus de détails

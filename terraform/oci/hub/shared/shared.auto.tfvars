# Copyright (C) Nicolas Lamirault <nicolas.lamirault@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0

#############################################################################
# Compartment IDs
#############################################################################

hub_compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"

#############################################################################
# Common Tags
#############################################################################

freeform_tags = {
  made-by     = "terraform"
  project     = "portefaix"
  environment = "shared"
  service     = "networking"
}

#############################################################################
# Network Configuration
#############################################################################

vcns = {
  # Hub VCN - Central network with shared services
  HUB-VCN = {
    display_name      = "vcn-hub"
    compartment_id    = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # Will be overridden by hub_compartment_id
    cidr_blocks       = ["10.0.0.0/20"]
    dns_label         = "hub"
    block_nat_traffic = false
  }

  # Spoke VCN - Development environment
  SPOKE-DEV-VCN = {
    display_name      = "vcn-core-dev"
    compartment_id    = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # Will be overridden by compartment_core_dev_id
    cidr_blocks       = ["10.1.0.0/20"]
    dns_label         = "coredev"
    block_nat_traffic = false
  }

  # Spoke VCN - Staging environment
  SPOKE-STAGING-VCN = {
    display_name      = "vcn-core-staging"
    compartment_id    = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # Will be overridden by compartment_core_staging_id
    cidr_blocks       = ["10.2.0.0/20"]
    dns_label         = "corestag"
    block_nat_traffic = false
  }

  # Spoke VCN - Production environment
  SPOKE-PROD-VCN = {
    display_name      = "vcn-core-prod"
    compartment_id    = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # Will be overridden by compartment_core_prod_id
    cidr_blocks       = ["10.3.0.0/20"]
    dns_label         = "coreprod"
    block_nat_traffic = false
  }
}

#############################################################################
# Hub Subnets
#############################################################################
hub_subnets = {
  HUB-SUBNET-SHARED = {
    compartment_id             = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # hub_compartment_id
    vcn_id                     = "HUB-VCN"
    cidr_block                 = "10.0.0.0/24"
    display_name               = "subnet-hub-shared"
    dns_label                  = "shared"
    availability_domain        = null
    prohibit_public_ip_on_vnic = true
    prohibit_internet_ingress  = true
    route_table_id             = "HUB-RT-SHARED"
    security_list_ids          = ["HUB-SL-SHARED"]
  }

  HUB-SUBNET-PUBLIC = {
    compartment_id             = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # hub_compartment_id
    vcn_id                     = "HUB-VCN"
    cidr_block                 = "10.0.1.0/24"
    display_name               = "subnet-hub-public"
    dns_label                  = "public"
    availability_domain        = null
    prohibit_public_ip_on_vnic = false
    prohibit_internet_ingress  = false
    route_table_id             = "HUB-RT-PUBLIC"
    security_list_ids          = ["HUB-SL-PUBLIC"]
  }
}

#############################################################################
# Dev Spoke Subnets for OKE
#############################################################################
dev_subnets = {
  SPOKE-DEV-SUBNET-OKE-API = {
    compartment_id             = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_dev_id
    vcn_id                     = "SPOKE-DEV-VCN"
    cidr_block                 = "10.1.0.0/28"
    display_name               = "subnet-dev-oke-api"
    dns_label                  = "okeapi"
    availability_domain        = null
    prohibit_public_ip_on_vnic = true
    prohibit_internet_ingress  = true
    route_table_id             = "SPOKE-DEV-RT-PRIVATE"
    security_list_ids          = ["SPOKE-DEV-SL-PRIVATE"]
  }

  SPOKE-DEV-SUBNET-OKE-NODES = {
    compartment_id             = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_dev_id
    vcn_id                     = "SPOKE-DEV-VCN"
    cidr_block                 = "10.1.1.0/24"
    display_name               = "subnet-dev-oke-nodes"
    dns_label                  = "okenodes"
    availability_domain        = null
    prohibit_public_ip_on_vnic = true
    prohibit_internet_ingress  = true
    route_table_id             = "SPOKE-DEV-RT-PRIVATE"
    security_list_ids          = ["SPOKE-DEV-SL-PRIVATE"]
  }

  SPOKE-DEV-SUBNET-OKE-LB = {
    compartment_id             = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_dev_id
    vcn_id                     = "SPOKE-DEV-VCN"
    cidr_block                 = "10.1.2.0/24"
    display_name               = "subnet-dev-oke-lb"
    dns_label                  = "okelb"
    availability_domain        = null
    prohibit_public_ip_on_vnic = false
    prohibit_internet_ingress  = false
    route_table_id             = "SPOKE-DEV-RT-PUBLIC"
    security_list_ids          = ["SPOKE-DEV-SL-PUBLIC"]
  }
}

#############################################################################
# Staging Spoke Subnets for OKE
#############################################################################
staging_subnets = {
  SPOKE-STAGING-SUBNET-OKE-API = {
    compartment_id             = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_staging_id
    vcn_id                     = "SPOKE-STAGING-VCN"
    cidr_block                 = "10.2.0.0/28"
    display_name               = "subnet-staging-oke-api"
    dns_label                  = "okeapi"
    availability_domain        = null
    prohibit_public_ip_on_vnic = true
    prohibit_internet_ingress  = true
    route_table_id             = "SPOKE-STAGING-RT-PRIVATE"
    security_list_ids          = ["SPOKE-STAGING-SL-PRIVATE"]
  }

  SPOKE-STAGING-SUBNET-OKE-NODES = {
    compartment_id             = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_staging_id
    vcn_id                     = "SPOKE-STAGING-VCN"
    cidr_block                 = "10.2.1.0/24"
    display_name               = "subnet-staging-oke-nodes"
    dns_label                  = "okenodes"
    availability_domain        = null
    prohibit_public_ip_on_vnic = true
    prohibit_internet_ingress  = true
    route_table_id             = "SPOKE-STAGING-RT-PRIVATE"
    security_list_ids          = ["SPOKE-STAGING-SL-PRIVATE"]
  }

  SPOKE-STAGING-SUBNET-OKE-LB = {
    compartment_id             = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_staging_id
    vcn_id                     = "SPOKE-STAGING-VCN"
    cidr_block                 = "10.2.2.0/24"
    display_name               = "subnet-staging-oke-lb"
    dns_label                  = "okelb"
    availability_domain        = null
    prohibit_public_ip_on_vnic = false
    prohibit_internet_ingress  = false
    route_table_id             = "SPOKE-STAGING-RT-PUBLIC"
    security_list_ids          = ["SPOKE-STAGING-SL-PUBLIC"]
  }
}

#############################################################################
# Production Spoke Subnets for OKE
#############################################################################
prod_subnets = {
  SPOKE-PROD-SUBNET-OKE-API = {
    compartment_id             = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_prod_id
    vcn_id                     = "SPOKE-PROD-VCN"
    cidr_block                 = "10.3.0.0/28"
    display_name               = "subnet-prod-oke-api"
    dns_label                  = "okeapi"
    availability_domain        = null
    prohibit_public_ip_on_vnic = true
    prohibit_internet_ingress  = true
    route_table_id             = "SPOKE-PROD-RT-PRIVATE"
    security_list_ids          = ["SPOKE-PROD-SL-PRIVATE"]
  }

  SPOKE-PROD-SUBNET-OKE-NODES = {
    compartment_id             = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_prod_id
    vcn_id                     = "SPOKE-PROD-VCN"
    cidr_block                 = "10.3.1.0/24"
    display_name               = "subnet-prod-oke-nodes"
    dns_label                  = "okenodes"
    availability_domain        = null
    prohibit_public_ip_on_vnic = true
    prohibit_internet_ingress  = true
    route_table_id             = "SPOKE-PROD-RT-PRIVATE"
    security_list_ids          = ["SPOKE-PROD-SL-PRIVATE"]
  }

  SPOKE-PROD-SUBNET-OKE-LB = {
    compartment_id             = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_prod_id
    vcn_id                     = "SPOKE-PROD-VCN"
    cidr_block                 = "10.3.2.0/24"
    display_name               = "subnet-prod-oke-lb"
    dns_label                  = "okelb"
    availability_domain        = null
    prohibit_public_ip_on_vnic = false
    prohibit_internet_ingress  = false
    route_table_id             = "SPOKE-PROD-RT-PUBLIC"
    security_list_ids          = ["SPOKE-PROD-SL-PUBLIC"]
  }
}

#############################################################################
# Hub Security Lists
#############################################################################
hub_security_lists = {
  HUB-SL-SHARED = {
    compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # hub_compartment_id
    vcn_id         = "HUB-VCN"
    display_name   = "sl-hub-shared"

    ingress_rules = [
      {
        description = "Allow all traffic from Spoke VCNs"
        stateless   = false
        protocol    = "all"
        src         = "10.0.0.0/8"
        src_type    = "CIDR_BLOCK"
      }
    ]

    egress_rules = [
      {
        description = "Allow all outbound traffic"
        stateless   = false
        protocol    = "all"
        dst         = "0.0.0.0/0"
        dst_type    = "CIDR_BLOCK"
      }
    ]
  }

  HUB-SL-PUBLIC = {
    compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # hub_compartment_id
    vcn_id         = "HUB-VCN"
    display_name   = "sl-hub-public"

    ingress_rules = [
      {
        description = "Allow HTTPS from Internet"
        stateless   = false
        protocol    = "6" # TCP
        src         = "0.0.0.0/0"
        src_type    = "CIDR_BLOCK"
        tcp_min     = 443
        tcp_max     = 443
      }
    ]

    egress_rules = [
      {
        description = "Allow all outbound traffic"
        stateless   = false
        protocol    = "all"
        dst         = "0.0.0.0/0"
        dst_type    = "CIDR_BLOCK"
      }
    ]
  }
}

#############################################################################
# Dev Spoke Security Lists
#############################################################################
dev_security_lists = {
  SPOKE-DEV-SL-PRIVATE = {
    compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_dev_id
    vcn_id         = "SPOKE-DEV-VCN"
    display_name   = "sl-dev-private"

    ingress_rules = [
      {
        description = "Allow all from VCN"
        stateless   = false
        protocol    = "all"
        src         = "10.1.0.0/20"
        src_type    = "CIDR_BLOCK"
      },
      {
        description = "Allow all from Hub"
        stateless   = false
        protocol    = "all"
        src         = "10.0.0.0/20"
        src_type    = "CIDR_BLOCK"
      }
    ]

    egress_rules = [
      {
        description = "Allow all outbound"
        stateless   = false
        protocol    = "all"
        dst         = "0.0.0.0/0"
        dst_type    = "CIDR_BLOCK"
      }
    ]
  }

  SPOKE-DEV-SL-PUBLIC = {
    compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_dev_id
    vcn_id         = "SPOKE-DEV-VCN"
    display_name   = "sl-dev-public"

    ingress_rules = [
      {
        description = "Allow HTTPS from Internet"
        stateless   = false
        protocol    = "6" # TCP
        src         = "0.0.0.0/0"
        src_type    = "CIDR_BLOCK"
        tcp_min     = 443
        tcp_max     = 443
      },
      {
        description = "Allow HTTP from Internet"
        stateless   = false
        protocol    = "6" # TCP
        src         = "0.0.0.0/0"
        src_type    = "CIDR_BLOCK"
        tcp_min     = 80
        tcp_max     = 80
      }
    ]

    egress_rules = [
      {
        description = "Allow all outbound"
        stateless   = false
        protocol    = "all"
        dst         = "0.0.0.0/0"
        dst_type    = "CIDR_BLOCK"
      }
    ]
  }
}

#############################################################################
# Staging Spoke Security Lists
#############################################################################
staging_security_lists = {
  SPOKE-STAGING-SL-PRIVATE = {
    compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_staging_id
    vcn_id         = "SPOKE-STAGING-VCN"
    display_name   = "sl-staging-private"

    ingress_rules = [
      {
        description = "Allow all from VCN"
        stateless   = false
        protocol    = "all"
        src         = "10.2.0.0/20"
        src_type    = "CIDR_BLOCK"
      },
      {
        description = "Allow all from Hub"
        stateless   = false
        protocol    = "all"
        src         = "10.0.0.0/20"
        src_type    = "CIDR_BLOCK"
      }
    ]

    egress_rules = [
      {
        description = "Allow all outbound"
        stateless   = false
        protocol    = "all"
        dst         = "0.0.0.0/0"
        dst_type    = "CIDR_BLOCK"
      }
    ]
  }

  SPOKE-STAGING-SL-PUBLIC = {
    compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_staging_id
    vcn_id         = "SPOKE-STAGING-VCN"
    display_name   = "sl-staging-public"

    ingress_rules = [
      {
        description = "Allow HTTPS from Internet"
        stateless   = false
        protocol    = "6" # TCP
        src         = "0.0.0.0/0"
        src_type    = "CIDR_BLOCK"
        tcp_min     = 443
        tcp_max     = 443
      },
      {
        description = "Allow HTTP from Internet"
        stateless   = false
        protocol    = "6" # TCP
        src         = "0.0.0.0/0"
        src_type    = "CIDR_BLOCK"
        tcp_min     = 80
        tcp_max     = 80
      }
    ]

    egress_rules = [
      {
        description = "Allow all outbound"
        stateless   = false
        protocol    = "all"
        dst         = "0.0.0.0/0"
        dst_type    = "CIDR_BLOCK"
      }
    ]
  }
}

#############################################################################
# Production Spoke Security Lists
#############################################################################
prod_security_lists = {
  SPOKE-PROD-SL-PRIVATE = {
    compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_prod_id
    vcn_id         = "SPOKE-PROD-VCN"
    display_name   = "sl-prod-private"

    ingress_rules = [
      {
        description = "Allow all from VCN"
        stateless   = false
        protocol    = "all"
        src         = "10.3.0.0/20"
        src_type    = "CIDR_BLOCK"
      },
      {
        description = "Allow all from Hub"
        stateless   = false
        protocol    = "all"
        src         = "10.0.0.0/20"
        src_type    = "CIDR_BLOCK"
      }
    ]

    egress_rules = [
      {
        description = "Allow all outbound"
        stateless   = false
        protocol    = "all"
        dst         = "0.0.0.0/0"
        dst_type    = "CIDR_BLOCK"
      }
    ]
  }

  SPOKE-PROD-SL-PUBLIC = {
    compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_prod_id
    vcn_id         = "SPOKE-PROD-VCN"
    display_name   = "sl-prod-public"

    ingress_rules = [
      {
        description = "Allow HTTPS from Internet"
        stateless   = false
        protocol    = "6" # TCP
        src         = "0.0.0.0/0"
        src_type    = "CIDR_BLOCK"
        tcp_min     = 443
        tcp_max     = 443
      },
      {
        description = "Allow HTTP from Internet"
        stateless   = false
        protocol    = "6" # TCP
        src         = "0.0.0.0/0"
        src_type    = "CIDR_BLOCK"
        tcp_min     = 80
        tcp_max     = 80
      }
    ]

    egress_rules = [
      {
        description = "Allow all outbound"
        stateless   = false
        protocol    = "all"
        dst         = "0.0.0.0/0"
        dst_type    = "CIDR_BLOCK"
      }
    ]
  }
}

#############################################################################
# Hub Route Tables
#############################################################################
hub_route_tables = {
  HUB-RT-SHARED = {
    compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # hub_compartment_id
    vcn_id         = "HUB-VCN"
    display_name   = "rt-hub-shared"

    route_rules = [
      {
        description       = "Route to Internet via NAT Gateway"
        destination       = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        network_entity_id = "HUB-NAT-GW"
      },
      {
        description       = "Route to Spokes via DRG"
        destination       = "10.1.0.0/16"
        destination_type  = "CIDR_BLOCK"
        network_entity_id = "HUB-DRG"
      }
    ]
  }

  HUB-RT-PUBLIC = {
    compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # hub_compartment_id
    vcn_id         = "HUB-VCN"
    display_name   = "rt-hub-public"

    route_rules = [
      {
        description       = "Route to Internet via Internet Gateway"
        destination       = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        network_entity_id = "HUB-INET-GW"
      }
    ]
  }
}

#############################################################################
# Dev Spoke Route Tables
#############################################################################
dev_route_tables = {
  SPOKE-DEV-RT-PRIVATE = {
    compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_dev_id
    vcn_id         = "SPOKE-DEV-VCN"
    display_name   = "rt-dev-private"

    route_rules = [
      {
        description       = "Route to Hub via DRG"
        destination       = "10.0.0.0/20"
        destination_type  = "CIDR_BLOCK"
        network_entity_id = "HUB-DRG"
      },
      {
        description       = "Route to other Spokes via DRG"
        destination       = "10.2.0.0/15"
        destination_type  = "CIDR_BLOCK"
        network_entity_id = "HUB-DRG"
      },
      {
        description       = "Route to Internet via NAT Gateway"
        destination       = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        network_entity_id = "SPOKE-DEV-NAT-GW"
      }
    ]
  }

  SPOKE-DEV-RT-PUBLIC = {
    compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_dev_id
    vcn_id         = "SPOKE-DEV-VCN"
    display_name   = "rt-dev-public"

    route_rules = [
      {
        description       = "Route to Internet via Internet Gateway"
        destination       = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        network_entity_id = "SPOKE-DEV-INET-GW"
      }
    ]
  }
}

#############################################################################
# Staging Spoke Route Tables
#############################################################################
staging_route_tables = {
  SPOKE-STAGING-RT-PRIVATE = {
    compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_staging_id
    vcn_id         = "SPOKE-STAGING-VCN"
    display_name   = "rt-staging-private"

    route_rules = [
      {
        description       = "Route to Hub via DRG"
        destination       = "10.0.0.0/20"
        destination_type  = "CIDR_BLOCK"
        network_entity_id = "HUB-DRG"
      },
      {
        description       = "Route to other Spokes via DRG"
        destination       = "10.1.0.0/20"
        destination_type  = "CIDR_BLOCK"
        network_entity_id = "HUB-DRG"
      },
      {
        description       = "Route to other Spokes via DRG"
        destination       = "10.3.0.0/20"
        destination_type  = "CIDR_BLOCK"
        network_entity_id = "HUB-DRG"
      },
      {
        description       = "Route to Internet via NAT Gateway"
        destination       = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        network_entity_id = "SPOKE-STAGING-NAT-GW"
      }
    ]
  }

  SPOKE-STAGING-RT-PUBLIC = {
    compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_staging_id
    vcn_id         = "SPOKE-STAGING-VCN"
    display_name   = "rt-staging-public"

    route_rules = [
      {
        description       = "Route to Internet via Internet Gateway"
        destination       = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        network_entity_id = "SPOKE-STAGING-INET-GW"
      }
    ]
  }
}

#############################################################################
# Production Spoke Route Tables
#############################################################################
prod_route_tables = {
  SPOKE-PROD-RT-PRIVATE = {
    compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_prod_id
    vcn_id         = "SPOKE-PROD-VCN"
    display_name   = "rt-prod-private"

    route_rules = [
      {
        description       = "Route to Hub via DRG"
        destination       = "10.0.0.0/20"
        destination_type  = "CIDR_BLOCK"
        network_entity_id = "HUB-DRG"
      },
      {
        description       = "Route to other Spokes via DRG"
        destination       = "10.1.0.0/19"
        destination_type  = "CIDR_BLOCK"
        network_entity_id = "HUB-DRG"
      },
      {
        description       = "Route to Internet via NAT Gateway"
        destination       = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        network_entity_id = "SPOKE-PROD-NAT-GW"
      }
    ]
  }

  SPOKE-PROD-RT-PUBLIC = {
    compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_prod_id
    vcn_id         = "SPOKE-PROD-VCN"
    display_name   = "rt-prod-public"

    route_rules = [
      {
        description       = "Route to Internet via Internet Gateway"
        destination       = "0.0.0.0/0"
        destination_type  = "CIDR_BLOCK"
        network_entity_id = "SPOKE-PROD-INET-GW"
      }
    ]
  }
}

#############################################################################
# VCN-Specific Gateways Definition
#############################################################################
vcn_gateways = {
  internet_gateways = {
    # Hub Internet Gateway
    HUB-INET-GW = {
      compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # hub_compartment_id
      vcn_id         = "HUB-VCN"
      display_name   = "igw-hub"
      enabled        = true
    }

    # Spoke Internet Gateways
    SPOKE-DEV-INET-GW = {
      compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_dev_id
      vcn_id         = "SPOKE-DEV-VCN"
      display_name   = "igw-dev"
      enabled        = true
    }

    SPOKE-STAGING-INET-GW = {
      compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_staging_id
      vcn_id         = "SPOKE-STAGING-VCN"
      display_name   = "igw-staging"
      enabled        = true
    }

    SPOKE-PROD-INET-GW = {
      compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_prod_id
      vcn_id         = "SPOKE-PROD-VCN"
      display_name   = "igw-prod"
      enabled        = true
    }
  }

  nat_gateways = {
    # Hub NAT Gateway
    HUB-NAT-GW = {
      compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # hub_compartment_id
      vcn_id         = "HUB-VCN"
      display_name   = "natgw-hub"
      block_traffic  = false
    }

    # Spoke NAT Gateways
    SPOKE-DEV-NAT-GW = {
      compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_dev_id
      vcn_id         = "SPOKE-DEV-VCN"
      display_name   = "natgw-dev"
      block_traffic  = false
    }

    SPOKE-STAGING-NAT-GW = {
      compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_staging_id
      vcn_id         = "SPOKE-STAGING-VCN"
      display_name   = "natgw-staging"
      block_traffic  = false
    }

    SPOKE-PROD-NAT-GW = {
      compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_prod_id
      vcn_id         = "SPOKE-PROD-VCN"
      display_name   = "natgw-prod"
      block_traffic  = false
    }
  }

  service_gateways = {
    # Hub Service Gateway
    HUB-SGW = {
      compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # hub_compartment_id
      vcn_id         = "HUB-VCN"
      display_name   = "sgw-hub"
      services       = "all-services"
    }

    # Spoke Service Gateways
    SPOKE-DEV-SGW = {
      compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_dev_id
      vcn_id         = "SPOKE-DEV-VCN"
      display_name   = "sgw-dev"
      services       = "all-services"
    }

    SPOKE-STAGING-SGW = {
      compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_staging_id
      vcn_id         = "SPOKE-STAGING-VCN"
      display_name   = "sgw-staging"
      services       = "all-services"
    }

    SPOKE-PROD-SGW = {
      compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # compartment_core_prod_id
      vcn_id         = "SPOKE-PROD-VCN"
      display_name   = "sgw-prod"
      services       = "all-services"
    }
  }
}

#############################################################################
# DRG Configuration
#############################################################################
drg_config = {
  dynamic_routing_gateways = {
    HUB-DRG = {
      compartment_id = "ocid1.compartment.oc1..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # hub_compartment_id
      display_name   = "drg-hub"

      # DRG Attachments to connect VCNs
      drg_attachments = {
        HUB-DRG-ATT = {
          display_name       = "drg-att-hub"
          vcn_id             = "HUB-VCN"
          drg_route_table_id = "DRG-RT-HUB"
        }

        SPOKE-DEV-DRG-ATT = {
          display_name       = "drg-att-dev"
          vcn_id             = "SPOKE-DEV-VCN"
          drg_route_table_id = "DRG-RT-SPOKE"
        }

        SPOKE-STAGING-DRG-ATT = {
          display_name       = "drg-att-staging"
          vcn_id             = "SPOKE-STAGING-VCN"
          drg_route_table_id = "DRG-RT-SPOKE"
        }

        SPOKE-PROD-DRG-ATT = {
          display_name       = "drg-att-prod"
          vcn_id             = "SPOKE-PROD-VCN"
          drg_route_table_id = "DRG-RT-SPOKE"
        }
      }

      # DRG Route Tables
      drg_route_tables = {
        DRG-RT-HUB = {
          display_name = "drg-rt-hub"

          # Import all routes from spokes
          import_drg_route_distribution_id = "DRG-RT-DIST-SPOKE"
        }

        DRG-RT-SPOKE = {
          display_name = "drg-rt-spoke"

          # Static routes to hub and other spokes
          route_rules = [
            {
              destination                = "10.0.0.0/20"
              destination_type           = "CIDR_BLOCK"
              next_hop_drg_attachment_id = "HUB-DRG-ATT"
            }
          ]
        }
      }

      # DRG Route Distributions
      drg_route_distributions = {
        DRG-RT-DIST-SPOKE = {
          display_name      = "drg-rt-dist-spoke"
          distribution_type = "IMPORT"

          # Import routes from all spoke attachments
          statements = [
            {
              priority = 1
              action   = "ACCEPT"
              match_criteria = {
                match_type        = "DRG_ATTACHMENT_ID"
                attachment_type   = "VCN"
                drg_attachment_id = "SPOKE-DEV-DRG-ATT"
              }
            },
            {
              priority = 2
              action   = "ACCEPT"
              match_criteria = {
                match_type        = "DRG_ATTACHMENT_ID"
                attachment_type   = "VCN"
                drg_attachment_id = "SPOKE-STAGING-DRG-ATT"
              }
            },
            {
              priority = 3
              action   = "ACCEPT"
              match_criteria = {
                match_type        = "DRG_ATTACHMENT_ID"
                attachment_type   = "VCN"
                drg_attachment_id = "SPOKE-PROD-DRG-ATT"
              }
            }
          ]
        }
      }
    }
  }
}

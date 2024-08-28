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
# Provider

region = "eu-west-1"

#############################################################################
# Project

org_name = "portefaix"

core_account_id = "845676325565"

#############################################################################
# Networking

vpc_name = "portefaix-staging"

#############################################################################
# Kubernetes cluster

cluster_name = "portefaix-staging-eks"

cluster_version = "1.30"

tags = {
  "Name"    = "portefaix-staging-eks"
  "Env"     = "Staging"
  "Service" = "Kubernetes"
}

cluster_tags = {
  "Role" = "EKS Cluster"
}

eks_managed_node_group_defaults = {
  # Graviton 2
  # ami_type  = "AL2_ARM_64"
  ami_type       = "AL2_x86_64"
  instance_types = ["m6i.large", "m5.large", "m5n.large", "m5zn.large"]
  disk_size      = 50
}

eks_managed_node_groups = {
  core = {
    min_size     = 1
    max_size     = 5
    desired_size = 3

    instance_types = ["t3.large"]
    # capacity_type  = "SPOT"
    labels = {
      Name    = "portefaix-staging-eks-core"
      Env     = "staging"
      Service = "kubernetes"
    }

    # taints = {
    #   dedicated = {
    #     key    = "dedicated"
    #     value  = "gpuGroup"
    #     effect = "NO_SCHEDULE"
    #   }
    # }

    update_config = {
      max_unavailable_percentage = 50 # or set `max_unavailable`
    }

    tags = {
      NodePool                                       = "core"
      "karpenter.sh/discovery/portefaix-staging-eks" = "portefaix-staging-eks"
    }
  }

  ops = {
    min_size     = 0
    max_size     = 1
    desired_size = 1

    instance_types = ["t3.large"]
    capacity_type  = "SPOT"
    labels = {
      Name    = "portefaix-staging-eks-core"
      Env     = "staging"
      Service = "kubernetes"
    }

    taints = {
      role = {
        key    = "role"
        value  = "ops"
        effect = "NO_SCHEDULE"
      }
    }

    update_config = {
      max_unavailable_percentage = 50 # or set `max_unavailable`
    }

    tags = {
      NodePool                                       = "ops"
      "karpenter.sh/discovery/portefaix-staging-eks" = "portefaix-staging-eks"
    }
  }
}

fargate_profiles = {
  karpenter = {
    name = "karpenter"
    selectors = [
      {
        namespace = "karpenter"
      }
    ]
  }
  pocs = {
    name = "pocs"
    selectors = [
      {
        namespace = "portefaix-pocs"
        labels = {
          app = "poc"
        }
      },
    ]

    tags = {
      Profile = "fargate"
    }

    timeouts = {
      create = "20m"
      delete = "20m"
    }
  }
}

cluster_addons = {
  coredns = {
    most_recent = true
  }
  kube-proxy = {
    most_recent = true
  }
  vpc-cni = {
    most_recent = true
  }
  eks-pod-identity-agent = {
    most_recent = true
  }
}

#############################################################################
# EBS CSI Driver

# ebs_csi_controller_role_name = "ebs-csi-driver-controller"

ebs_csi_controller_sa_name   = "ebs-csi-controller"
ebs_csi_controller_namespace = "kube-system"

ebs_csi_driver_tags = {
  "Role"    = "ebs-csi-driver"
  "Service" = "csi-driver"
}

#############################################################################
# EFS CSI Driver

# efs_csi_controller_role_name = "efs-csi-driver-controller"

efs_csi_controller_sa_name   = "efs-csi-controller"
efs_csi_controller_namespace = "kube-system"

efs_csi_driver_tags = {
  "Role"    = "efs-csi-driver"
  "Service" = "csi-driver"
}

#############################################################################
# FSX CSI Driver

# fsx_csi_controller_role_name = "fsx-csi-driver-controller"

fsx_csi_controller_sa_name   = "fsx-csi-controller"
fsx_csi_controller_namespace = "kube-system"

fsx_csi_driver_tags = {
  "Role"    = "fsx-csi-driver"
  "Service" = "csi-driver"
}

#############################################################################
# Secret Store CSI Driver

# secret_store_csi_controller_role_name = "secret-store-csi-driver-controller"

secret_store_csi_driver_tags = {
  "Role"    = "secret-store-csi-driver"
  "Service" = "secrets-manager"
}
secrets_data = []

#############################################################################
# AWS ALB Controller

alb_controller_sa_name   = "aws-load-balancer-controller"
alb_controller_namespace = "kube-system"

alb_controller_tags = {
  "Role"    = "aws-alb-controller"
  "Service" = "load-balancer"
}

#############################################################################
# AppMesh Controller

appmesh_sa_name   = "appmesh-controller"
appmesh_namespace = "appmesh-system"

appmesh_tags = {
  "Role"    = "appmesh-controller"
  "Service" = "service-mesh"
}

#############################################################################
# Node Terminaison Handler

node_termination_handler_sa_name   = "node-terminaison-hander"
node_termination_handler_namespace = "kube-system"

node_termination_handler_tags = {
  "Role"    = "node-terminaison-hander"
  "Service" = "system"
}

#############################################################################
# Karpenter

karpenter_sa_name   = "karpenter"
karpenter_namespace = "kube-system"

karpenter_tags = {
  "Role"    = "karpenter"
  "Service" = "autoscaler"
}

karpenter_queue_name = "portefaix-staging-eks-karpenter"

#############################################################################
# External Secrets Operator

eso_sa_name   = "eso-controller"
eso_namespace = "kube-system"

eso_tags = {
  "Role"    = "external-secrets-operator"
  "Service" = "secrets-manager"
}

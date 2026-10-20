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
# Fargate

fargate_tags = {
  "Role"    = "fargate"
  "Service" = "kubernetes"
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

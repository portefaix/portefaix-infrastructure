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

module "observability" {
  source = "../modules/observability"

  cloudflare_account_id = var.cloudflare_account_id
  cloudflare_api_token  = var.cloudflare_api_token
  buckets               = var.buckets
}

moved {
  from = aws_s3_bucket.observability["portefaix-homelab-logs-admin"]
  to   = module.observability.aws_s3_bucket.observability["portefaix-homelab-logs-admin"]
}

moved {
  from = aws_s3_bucket.observability["portefaix-homelab-logs-chuncks"]
  to   = module.observability.aws_s3_bucket.observability["portefaix-homelab-logs-chunks"]
}

moved {
  from = aws_s3_bucket.observability["portefaix-homelab-logs-ruler"]
  to   = module.observability.aws_s3_bucket.observability["portefaix-homelab-logs-ruler"]
}

moved {
  from = aws_s3_bucket.observability["portefaix-homelab-metrics-admin"]
  to   = module.observability.aws_s3_bucket.observability["portefaix-homelab-metrics-admin"]
}

moved {
  from = aws_s3_bucket.observability["portefaix-homelab-metrics-alert"]
  to   = module.observability.aws_s3_bucket.observability["portefaix-homelab-metrics-alert"]
}

moved {
  from = aws_s3_bucket.observability["portefaix-homelab-metrics-tsdb"]
  to   = module.observability.aws_s3_bucket.observability["portefaix-homelab-metrics-tsdb"]
}

moved {
  from = aws_s3_bucket.observability["portefaix-homelab-quickwit-data"]
  to   = module.observability.aws_s3_bucket.observability["portefaix-homelab-quickwit-data"]
}

moved {
  from = aws_s3_bucket.observability["portefaix-homelab-traces-chunks"]
  to   = module.observability.aws_s3_bucket.observability["portefaix-homelab-metrics-admin"]
}

moved {
  from = aws_s3_bucket_lifecycle_configuration.life_cycles["portefaix-homelab-logs-admin"]
  to   = module.observability.aws_s3_bucket_lifecycle_configuration.life_cycles["portefaix-homelab-logs-admin"]
}

moved {
  from = aws_s3_bucket_lifecycle_configuration.life_cycles["portefaix-homelab-logs-chuncks"]
  to   = module.observability.aws_s3_bucket_lifecycle_configuration.life_cycles["portefaix-homelab-logs-chuncks"]
}

moved {
  from = aws_s3_bucket_lifecycle_configuration.life_cycles["portefaix-homelab-logs-ruler"]
  to   = module.observability.aws_s3_bucket_lifecycle_configuration.life_cycles["portefaix-homelab-logs-ruler"]
}

moved {
  from = aws_s3_bucket_lifecycle_configuration.life_cycles["portefaix-homelab-metrics-admin"]
  to   = module.observability.aws_s3_bucket_lifecycle_configuration.life_cycles["portefaix-homelab-metrics-admin"]
}

moved {
  from = aws_s3_bucket_lifecycle_configuration.life_cycles["portefaix-homelab-metrics-alert"]
  to   = module.observability.aws_s3_bucket_lifecycle_configuration.life_cycles["portefaix-homelab-metrics-alert"]
}

moved {
  from = aws_s3_bucket_lifecycle_configuration.life_cycles["portefaix-homelab-metrics-tsdb"]
  to   = module.observability.aws_s3_bucket_lifecycle_configuration.life_cycles["portefaix-homelab-metrics-tsdb"]
}

moved {
  from = aws_s3_bucket_lifecycle_configuration.life_cycles["portefaix-homelab-quickwit-data"]
  to   = module.observability.aws_s3_bucket_lifecycle_configuration.life_cycles["portefaix-homelab-quickwit-data"]
}

moved {
  from = aws_s3_bucket_lifecycle_configuration.life_cycles["portefaix-homelab-traces-chunks"]
  to   = module.observability.aws_s3_bucket_lifecycle_configuration.life_cycles["portefaix-homelab-traces-chunks"]
}

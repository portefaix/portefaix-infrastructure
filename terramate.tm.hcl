terramate {
  required_version = "~> 0.8"

  config {
    cloud {
      organization = "portefaix"
    }

    git {
      # Git configuration
      default_remote = "origin"
      default_branch = "main"

      # Safeguard
      check_untracked   = false # Deprecated as of v0.4.5 (use terramate.config.disable_safeguards instead)
      check_uncommitted = false # Deprecated as of v0.4.5 (use terramate.config.disable_safeguards instead)
      check_remote      = false # Deprecated as of v0.4.5 (use terramate.config.disable_safeguards instead)
    }

    # run {
    #   env {
    #     TF_PLUGIN_CACHE_DIR = "${terramate.root.path.fs.absolute}/.tf_plugin_cache_dir"
    #   }
    # }

    # Enable Terramate Scripts
    experiments = [
      "scripts",
    ]
  }
}

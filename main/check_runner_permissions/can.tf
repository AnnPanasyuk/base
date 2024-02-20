data "scalr_module_version" "can_get_modver" {
  source  = var.read_module_path
  version = var.read_module_version
}

resource "null_resource" "cat_get_users" {
  provisioner "local-exec" {
    command = <<EOT
    curl --request GET \
        --url 'https:///$${SCALR_HOSTNAME}/api/iacp/v3/users' \
        --header 'Prefer: profile=preview' \
        --header 'accept: application/vnd.api+json' \
        --header 'authorization: Bearer $${SCALR_TOKEN}'
    EOT
  }
}

data "scalr_variables" "can_read_vars" {
  keys             = ["some"]
  category         = "terraform" # or shell
  envrironment_ids = ["${var.read_env_id}", "null"]
}
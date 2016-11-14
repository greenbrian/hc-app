data "template_file" "install_consul_client" {
  template = "${file("${path.module}/consul/${var.os}/provision-consul-client.sh.tpl")}"

  vars {
    region            = "${var.region}"
    atlas_token       = "${var.atlas_token}"
    atlas_username    = "${var.atlas_username}"
    atlas_environment = "${var.atlas_environment}"
    instance_id_url   = "http://169.254.169.254/2014-02-25/meta-data/instance-id"
  }
}

output "install_consul_client" {
  value = "${data.template_file.install_consul_client.rendered}"
}

data "template_file" "install_consul_server" {
  template = "${file("${path.module}/consul/${var.os}/provision-consul-server.sh.tpl")}"

  vars {
    region              = "${var.region}"
    atlas_token         = "${var.atlas_token}"
    atlas_username      = "${var.atlas_username}"
    atlas_environment   = "${var.atlas_environment}"
    consul_server_nodes = "${var.consul_server_nodes}"
    instance_id_url     = "http://169.254.169.254/2014-02-25/meta-data/instance-id"
  }
}

output "install_consul_server" {
  value = "${data.template_file.install_consul_server.rendered}"
}

data "template_file" "install_nomad_server" {
  template = "${file("${path.module}/nomad/${var.os}/provision-nomad-server.sh.tpl")}"

  vars {
    region             = "${var.region}"
    atlas_token        = "${var.atlas_token}"
    atlas_username     = "${var.atlas_username}"
    atlas_environment  = "${var.atlas_environment}"
    nomad_server_nodes = "${var.nomad_server_nodes}"
    instance_id_url    = "http://169.254.169.254/2014-02-25/meta-data/instance-id"
  }
}

output "install_nomad_server" {
  value = "${data.template_file.install_nomad_server.rendered}"
}

data "template_file" "install_nomad_client" {
  template = "${file("${path.module}/nomad/${var.os}/provision-nomad-client.sh.tpl")}"

  vars {
    region            = "${var.region}"
    atlas_token       = "${var.atlas_token}"
    atlas_username    = "${var.atlas_username}"
    atlas_environment = "${var.atlas_environment}"
    instance_id_url   = "http://169.254.169.254/2014-02-25/meta-data/instance-id"
  }
}

output "install_nomad_client" {
  value = "${data.template_file.install_nomad_client.rendered}"
}

data "template_file" "install_vault_server" {
  template = "${file("${path.module}/vault/${var.os}/provision-vault-server.sh.tpl")}"

  vars {
    atlas_environment = "${var.atlas_environment}"
  }
}

output "install_vault_server" {
  value = "${data.template_file.install_vault_server.rendered}"
}

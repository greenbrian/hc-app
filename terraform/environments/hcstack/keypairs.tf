resource "aws_key_pair" "main" {
  key_name   = "${var.atlas_environment}"
  public_key = "${file(module.shared.public_key_path)}"
}

# locals.tf
locals {
  project  = "netology"
  env      = var.vpc_name
  platform = "platform"
  
  web_instance_name = "${local.project}-${local.env}-${local.platform}-web"
  db_instance_name  = "${local.project}-${local.env}-${local.platform}-db"
}
provider "aws" {
    region = "us-east-1"
}

module "app" {
    source = "../app"
    env = "prod"
    app = "ecsterraform"
    key_pair = "websites"
}

output "task_role" {
    value = "${module.app.task_iam_role}"
}

output "docker_repository" {
    value = "${module.app.ecr_repository}"
}

output "log_group" {
    value = "${module.app.log_group}"
}

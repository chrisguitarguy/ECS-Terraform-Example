provider "aws" {
    region = "us-east-1"
}

module "app" {
    source = "../app"
    env = "prod"
    app = "ecsterraform"
    key_pair = "websites"
}

output "task_iam_role" {
    value = "${module.app.task_iam_role}"
}

provider "aws" {
    region = "us-east-1"
}

module "app" {
    source = "../app"
    env = "prod"
    app = "ecsterraform"
    key_pair = "websites"
}

resource "aws_route53_record" "app" {
    name = "ecsterraform"
    zone_id = "Z3794BPBRJLEA3"
    type = "A"

    alias {
        name = "${module.app.loadbalancer_dns_name}"
        zone_id = "${module.app.loadbalancer_dns_zone}"
        evaluate_target_health = false
    }
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

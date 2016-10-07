output "task_iam_role" {
    value = "${aws_iam_role.tasks.arn}"
}

output "ecr_repository" {
    value = "${aws_ecr_repository.main.repository_url}"
}

output "log_group" {
    value = "${var.app}-${var.env}"
}

output "loadbalancer_dns_name" {
    value = "${aws_alb.main.dns_name}"
}

output "loadbalancer_dns_zone" {
    value = "${aws_alb.main.zone_id}"
}

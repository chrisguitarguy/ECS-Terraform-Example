output "task_iam_role" {
    value = "${aws_iam_role.tasks.arn}"
}

output "ecr_repository" {
    value = "${aws_ecr_repository.main.repository_url}"
}

resource "aws_ecr_repository" "main" {
    name = "${lower(var.app)}-${var.env}"
}

resource "null_resource" "docker_packaging" {
  depends_on = [
    aws_ecr_repository.noiselesstech,
  ]

  provisioner "local-exec" {
    command = "docker build -t ${aws_ecr_repository.noiselesstech.repository_url}:latest . && aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${data.aws_caller_identity.current.account_id}.dkr.ecr.us-east-1.amazonaws.com && docker push ${aws_ecr_repository.noiselesstech.repository_url}:latest"
  }

  # Not working! only the 1st command will be execturted in this way
  #  provisioner "local-exec" {
  #   command = <<-EOF
  #   docker build -t ${aws_ecr_repository.noiselesstech.repository_url}:latest .
  #   aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin ${data.aws_caller_identity.current.account_id}.dkr.ecr.us-east-1.amazonaws.com    
  #   docker push "${aws_ecr_repository.noiselesstech.repository_url}:latest"
  #   EOF
  # }

  triggers = {
    "run_at" = timestamp()
  }

}
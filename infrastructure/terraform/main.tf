provider "aws" {
  region = "us-west-2"
}

resource "aws_ecs_cluster" "main" {
  name = "fraud-detection-cluster"
}

resource "aws_ecs_task_definition" "main" {
  family                   = "fraud-detection-task"
  container_definitions    = jsonencode([{
    name      = "fraud-detection-service"
    image     = "example/fraud-detection-service"
    cpu       = 256
    memory    = 512
    essential = true
  }])
}

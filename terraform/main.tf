provider "aws" {
  region = "us-west-2"
}

resource "aws_ecs_cluster" "fraud_detection" {
  name = "fraud-detection-cluster"
}

resource "aws_ecs_task_definition" "fraud_task" {
  family                   = "fraud-detection"
  container_definitions    = jsonencode([
    {
      name      = "fraud-service",
      image     = "<docker-image-url>",
      cpu       = 256,
      memory    = 512,
      essential = true,
    }
  ])
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
}

resource "aws_ecs_service" "fraud_service" {
  name            = "fraud-service"
  cluster         = aws_ecs_cluster.fraud_detection.id
  task_definition = aws_ecs_task_definition.fraud_task.arn
  desired_count   = 1
  launch_type     = "FARGATE"
}
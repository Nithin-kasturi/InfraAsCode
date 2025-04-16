resource "aws_security_group" "alb_sg" {
  name = "ALB security group"
  description = "enable http/https access on port 80/443"
  vpc_id = var.vpc_id
  ingress {
    description = "Http access"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "https access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name="ALB-sg"
  }

}
#Internal security group between Web-Tier and App-Tier
resource "aws_security_group" "internal-sg" {
  name = "Internal Security group"
  description = "Allow access from alb sg"
  vpc_id = var.vpc_id
  ingress{
    description = "https access"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }
  egress{
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name="Internal-sg"
  }
}

resource "aws_security_group" "bastion" {
  name        = "sg_bastion_${var.project_name}"
  vpc_id      = "${aws_vpc.default.id}"
  tags = {
    Project = "${var.project_name}"
  }

  # SSH access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = "${var.remote_cidr_list}"
  }

  # Outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

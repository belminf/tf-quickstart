resource "aws_instance" "bastion" {

  instance_type = "${var.bastion_instance_type}"
  ami = "${var.bastion_ami}"

  key_name = "${var.key_name}"

  root_block_device {
    volume_size = "${var.bastion_root_gb}"
    volume_type = "${var.bastion_root_type}"
  }

  vpc_security_group_ids = ["${aws_security_group.bastion.id}"]
  subnet_id = "${aws_subnet.default.id}"

  tags = {
    Name = "bastion_${var.project_name}"
    Project = "${var.project_name}"
  }

  user_data = <<EOF
#!/usr/bin/env bash

# Create user
adduser ${var.bastion_user}

# Get SSH authkeys from Github
mkdir ~${var.bastion_user}/.ssh
chmod 700 ~${var.bastion_user}/.ssh
curl https://github.com/${var.github_user}.keys >> ~${var.bastion_user}/.ssh/authorized_keys
chmod 600 ~${var.bastion_user}/.ssh/authorized_keys
chown -R ${var.bastion_user}: ~${var.bastion_user}/.ssh

# Setup sudo
echo "${var.bastion_user} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/${var.bastion_user}
chmod 440 /etc/sudoers.d/${var.bastion_user}

EOF
}

output "ssh" {
  value = "${var.bastion_user}@${aws_instance.bastion.public_ip}"
}

# Launch 1A - public-1
# Launch 1B - public-1
# Launch 2A - Private-1
# Launch 3A - Private-2

resource "aws_instance" "inst_1A" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name
}

resource "aws_instance" "inst_1B" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name
}



resource "aws_instance" "inst_2A" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-private-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name
}

resource "aws_instance" "inst_3A" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-private-2.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name
}

output "instance_1A_ip_addr" {
  value = "${aws_instance.inst_1A.public_ip}"
}

output "instance_1B_ip_addr" {
  value = "${aws_instance.inst_1B.public_ip}"
}

output "instance_2A_ip_addr" {
  value = "${aws_instance.inst_1A.private_ip}"
}

output "instance_3A_ip_addr" {
  value = "${aws_instance.inst_1A.private_ip}"
}
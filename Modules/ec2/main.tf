resource "aws_instance" "ec2" {
  instance_type = var.instance_type
  region = var.region
  availability_zone = var.availability_zone
  associate_public_ip_address = var.associate_public_ip_address
  ami = var.ami
  key_name = var.key_name
  subnet_id = var.subnet_id
  tags = var.tags
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }
}




# Create a new key pair only if requested
resource "aws_key_pair" "generated" {
  count      = var.create_key_pair ? 1 : 0
  key_name   = var.key_pair_name != null ? var.key_pair_name : "my-generated-key"
  public_key = var.public_key
}

# Fetch existing key pair only if not creating a new one
data "aws_key_pair" "existing" {
  count    = var.create_key_pair ? 0 : 1
  key_name = var.key_pair_name
}

# EC2 instance
resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
  region = var.region

  # Choose key name dynamically
  key_name = var.create_key_pair ? aws_key_pair.generated[0].key_name  :data.aws_key_pair.existing[0].key_name

#   key_name = var.create_key_pair ? aws_key_pair.generated[0].key_name : data.aws_key_pair.existing[0].key_name

  tags = {
    Name = "MyFirstEC2"
  }
}

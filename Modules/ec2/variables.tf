variable "instance_type" {
  
}
variable "ami" {
  
}
variable "associate_public_ip_address" {
  
}
variable "availability_zone" {
  
}
variable "key_name" {
  
}
variable "region" {
  
}
variable "subnet_id" {
  
}
variable "tags" {
  
}

# ---------
variable "create_key_pair" {
  description = "Whether to create a new key pair (true) or use an existing one (false)"
  type        = bool
  default     = false
}

variable "key_pair_name" {
  description = "Name of the existing key pair to use (if not creating a new one)"
  type        = string
  default     = null
}

variable "public_key" {
  description = "Public key material (only required if creating a new key pair)"
  type        = string
  default     = null
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "env" {
    description = "this is the environment for my infra"
    type = string
  
}

variable "bucket_name" {

    description = "this is my bucket name for my infra"
    type = string
  
}

variable "instance_count" {
    description = "this is the number of the ec2 instance"
    type = number
  
}
variable "instance_type" {
    description = "this is the type of instance "
    type = string
}
variable "ec2_ami_id" {
    description = "this is the ami id of the instance"
    type = string
  
}

variable "hash_key" {
    description = "this is the hash key of the db"
    type = string
  
}
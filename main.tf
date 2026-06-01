#dev infrastructure
module "dev-infrapp" {
  source         = "./Infrastructure"
  env            = "dev"
  bucket_name    = "infra-app-bucket-yv202605"
  instance_count = 1
  instance_type  = "t2.micro"
  ec2_ami_id     = "ami-078f95be0757084a3" #amazon linux
  hash_key       = "StudentID"

}

#dev infrastructure
module "prd-infrapp" {
  source         = "./Infrastructure"
  env            = "prd-yv202605"
  bucket_name    = "infra-app-bucket"
  instance_count = 2
  instance_type  = "t2.medium"
  ec2_ami_id     = "ami-078f95be0757084a3" #amazon linux
  hash_key       = "StudentID"

}

#dev infrastructure
module "stg-infra" {
  source         = "./Infrastructure"
  env            = "stg"
  bucket_name    = "infra-app-bucketyv202605"
  instance_count = 1
  instance_type  = "t2.small"
  ec2_ami_id     = "ami-078f95be0757084a3" #amazon linux
  hash_key       = "StudentID"

}



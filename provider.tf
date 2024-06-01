Create a new EC2 instance with an Elastic IP in Ohaio region

------------------------------------------------------------------
provider.tf

provider "aws" {
  access_key = "AKIASAXXXXXXXXXXXXX7"
  secret_key = "jcuRz+2SDAASHkjhksaddkhk7sdSld4/EkWemp2wE"
  region = "us-east-2"

}

resource "aws_instance" "my-ec2" {
  tags = {
    Name = "1st-instance-by-terraform"
   }
  ami           = "ami-09040d770ffe2224f"
  instance_type = "t2.micro"
  key_name = "Ohio-Instance-kp"
  security_group = ["default", "test-sg"]
}

#Create ElasticIP
resource "aws_eip" "test-eip" {
  vpc = true
  instance = aws_instance.my-ec2.id
}

------------------------------------------------------------------

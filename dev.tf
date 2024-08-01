
provider "aws" {
  region     = "ap-northeast-3"

}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
}

resource "aws_instance" "jenkins" {
  ami           = "ami-0db6b6e701fbc0603"
  instance_type = "t2.micro"

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y openjdk-11-jdk
    sudo apt-get install -y maven
    sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian/jenkins.io.key
    echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list
    sudo apt-get update
    sudo apt-get install -y jenkins
    sudo systemctl start jenkins
    sudo systemctl enable jenkins
    sudo systemctl status jenkins
  EOF
}

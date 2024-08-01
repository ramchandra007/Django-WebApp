provider "aws" {
  region     = "ap-northeast-3"

}
resource "aws_instance" "nani" {
  ami                    = "ami-0db6b6e701fbc0603"
  instance_type          = "t2.micro"
  key_name = "kins"
  vpc_security_group_ids = [ "sg-08c4a01c6da41754f" ]
  

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get upgrade -y",
      "sudo apt install python3-pip -y",
      "sudo apt install python3-virtualenv -y",
      "sudo apt install python3-venv -y",
      "/usr/bin/python3 -m venv demo",
      "source /home/ubuntu/demo/bin/activate",
      "https://github.com/ramchandra007/Django-WebApp.git",
      "cd Django-WebApp",
      "/home/ubuntu/demo/bin/pip install django",
      "/home/ubuntu/demo/bin/pip install django-crispy-forms",
      "/home/ubuntu/demo/bin/pip install pillow",
      "/home/ubuntu/demo/bin/python manage.py makemigrations",
      "/home/ubuntu/demo/bin/python manage.py migrate",
      "/home/ubuntu/demo/bin/python manage.py runserver 0.0.0.0:8000",
    ]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("kins.pem")
    host        = aws_instance.nani.public_ip
  }
}
                                 

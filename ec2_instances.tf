resource "aws_instance" "custom_terminal" {
    ami             = "ami-0e040c48614ad1327"
    instance_type   = "t2.micro"
    key_name = var.Key_name
    security_groups = ["${var.ClientID}_custom_terminal_SG"]

    provisioner "file" {
        source = "ansible/custom_terminal.yaml"
        destination = "/home/ubuntu/custom_terminal.yaml"
    }
    provisioner "file" {
        source = "config/.tmux.conf"
        destination = "/home/ubuntu/.tmux.conf"
    }
    provisioner "file" {
        source = "config/.p10k.zsh"
        destination = "/home/ubuntu/.p10k.zsh"
    }
    provisioner "file" {
        source = "config/.zshrc"
        destination = "/home/ubuntu/.zshrc"
    }
    provisioner "file" {
        source = "config/.tmux.conf"
        destination = "/root/.tmux.conf"
    }
    provisioner "file" {
        source = "config/.p10k.zsh"
        destination = "/root/.p10k.zsh"
    }
    provisioner "file" {
        source = "config/.zshrc"
        destination = "/root/.zshrc"
    }
    connection {
        host = aws_instance.custom_terminal.public_ip
        type = "ssh"
        user = "ubuntu"
        private_key = file(var.Private_key)
    }
    provisioner "remote-exec" {
        inline = [
            "sleep 60",
            "sudo apt update",
            "sudo apt install ansible -y",
            "ansible-playbook custom_terminal.yaml"
        ]
    }

    tags                          = {
        Name        = "${var.ClientID}_custom_terminal"
        ClientID    = var.ClientID
    }
}
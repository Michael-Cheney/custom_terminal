resource "aws_security_group" "custom_terminal_SG" {
    name = "${var.ClientID}_custom_terminal_SG"
    tags                          = {
        Name        = "${var.ClientID}_custom_terminalr_SG"
        ClientID    = var.ClientID
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }
}
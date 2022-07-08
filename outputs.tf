output "A_Connect_to_C2_instance_with" {
  value = "ssh -i ${var.Private_key} ubuntu@${aws_instance.custom_terminal.public_ip}"
  description = "Test the description field"
}
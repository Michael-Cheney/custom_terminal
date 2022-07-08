variable "region" {
    default = "ap-southeast-2"
    description = "AWS Region"
}
variable "Key_name" {
    default = "ssh"
    description = "SSH Key"
}
variable "ClientID" {
    default = "123456"
    description = "Unique Client ID to differentiate resources"
}
variable "Private_key" {
    default = "C:\\temp\\ssh.pem"
    description = "Private key file location"
}
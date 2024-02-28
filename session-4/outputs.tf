output "main_instance_public_ip" {
    value = aws_instance.main[*].public_ip     # first_label.second_label.attribute, Reference to Resource
    description = "this prints the public ip of main instance"
}
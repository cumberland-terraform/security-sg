output "security_group" {
    description     = "Metadata of the Security Group that has been provisioned"
    value           = {
        id          = aws_security_group.this.id
        arn         = aws_security_group.this.arn
    }
}
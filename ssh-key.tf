resource "aws_key_pair" "ee" {
  key_name   = "${var.tenant}-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDtLGx4O0Z2eTjf6tz4wIKV7OI7NXGl5RLtim3cmu9111shEs6FcmVmK0tVKS4J3/XOJQRKhbO48dOh3NTkvwaNPUz7+Fnjap0DDimNKe5qevKVJEEy5SCtsVklpMP/+/WhKMTxM9DyERUWu9UT2FXQUss6B0YggtfX+KVrFaYSJB1cE+vMURxVk6IPtoeZ6NeA602jE6aa97oUEgpj+3tBOUFxnb+zRGu8IUl3uOfTDjW/vyEWxwL+6Cgvdm8MZgwiOLpFO0IczeIunKVBwC5zcY1qmM7o5vOTkyiOsZ5VB7TyJkFI6fNGlekfyECrQJlnJczDFrDsi+Ux4rHOjFlf6Xx5TMl3VwZgR6MZk9ovgxXkYkqO4+DKZwy8wCkBMcueMcuQU/7/rbGQjB23L2ENWwlZqb2RSQXpGIevG0NuZsHxeuysdmTSpsLzKHK7eg44DwFHbO2osCCvbBNMyPc6yLAfFnwOkw7PDqiFp4FCY5znNsmKdb8WkI0nCYFILwE= sumeet@KPL-048"
}

output "ee_key_name" {
  value = "${aws_key_pair.ee.key_name}"
}

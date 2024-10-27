variable "porta_http" {
    description = "porta HTTPS"
    default = 80
    type = number
}

variable "porta_https" {
    description = "porta HTTPS"
    default = 443
    type = number
}

variable "key_name" {
    description = "Nome da chave privada"
    default = "chave_privada_pi"
    type = string
}
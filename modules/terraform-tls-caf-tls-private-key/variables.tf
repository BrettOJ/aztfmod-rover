 variable "algorithm"{   
     description = "algorithim to use for the key encryption"
     default = "RSA"
}
variable "ecdsa_curve"{
    description = "setting to be used for the ecdsa curve algorithm"
    default = "P224"
}
variable "rsa_bits" {
    description = "encription bit rate"
    default = "2048"
}
   
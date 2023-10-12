variable "vpc_id" {
  default = "vpc-0c851e4624ca9e339"
}

variable "subnet_ids" {
    default = ["subnet-04e2d605de261c87a"]
  
}

variable "tags" {
  default = {
    BU            = "AYO-001"
    Environment   = "dev"
    Name          = "serveless-resources"
    Department    = "eng software"
    Owner         = "kidboo squard"
    Workload      = "booking-system"
  }
}
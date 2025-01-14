variable "setup" {
  type = map(string)
  default = {
    tokyo      = "ap-northeast-1"
    virginia   = "us-east-1"
    london     = "eu-west-2"
    sao-paulo  = "sa-east-1"
    australia  = "ap-southeast-2"
    hong-kong  = "ap-east-1"
    california = "us-west-1"
  }
}

variable "vpcs" {
  type = map(map(string))
  default = {
    tokyo = {                   
      region = "ap-northeast-1" 
      cidr   = "10.50.0.0/16"
      name   = "tokyo"
    }
    tokyo-test = {
      region = "ap-northeast-1"
      cidr   = "10.57.0.0/16"
      name   = "tokyo-test"
    }
    virginia = {
      region = "us-east-1"
      cidr   = "10.51.0.0/16"
      name   = "virginia"
    }
    hong-kong = {
      region = "ap-east-1"
      cidr   = "10.52.1.0/24"
      name   = "hong-kong"
    }
    australia = {
      region = "ap-southeast-2"
      cidr   = "10.30.1.0/24"
      name   = "australia"
    }
    california = {
      region = "us-west-1"
      cidr   = "10.31.1.0/24"
      name   = "california"
    }
    london = {
      region = "eu-west-2"
      cidr   = "10.32.1.0/24"
      name   = "london"
    }
    sao-paulo = {
      region = "sa-east-1"
      cidr   = "10.33.1.0/24"
      name   = "sao-paulo"
    }
  }
}

variable "tokyo-subnets" {
  type = map(map(string))
  default = {
    tokyo-a-public = {
      vpc  = "tokyo"
      cidr = "10.50.1.0/24"
      az   = "ap-northeast-1a"
    }
    tokyo-c-public = {
      vpc  = "tokyo"
      cidr = "10.50.3.0/24"
      az   = "ap-northeast-1c"
    }
    tokyo-a-private = {
      vpc  = "tokyo"
      cidr = "10.50.11.0/24"
      az   = "ap-northeast-1a"
    }
    
    tokyo-test-c-public = {
      vpc  = "tokyo-test"
      cidr = "10.50.12.0/24"
      az   = "ap-northeast-1c"
    }
  }
}

# grab the var.tokyo-subnets and create a new map with the keys that include private
locals {
  tokyo-nat = { for k, v in var.tokyo-subnets : k => v if can(regex("private", k)) }
}


variable "london-subnets" {
  type = map(map(string))
  default = {
    london-a-public = {
      vpc  = "london"
      cidr = "10.32.1.0/24"
      az   = "eu-west-2a"
    }
    london-b-public = {
      vpc  = "london"
      cidr = "10.32.2.0/24"
      az   = "eu-west-2b"
    }
  }
}



variable "sao-paulo-subnets" {
  type = map(map(string))
  default = {
    sao-paulo-a-public = {
      vpc  = "sao-paulo"
      cidr = "10.33.1.0/24"
      az   = "sa-east-1a"
    }
    sao-paulo-c-public = {
      vpc  = "sao-paulo"
      cidr = "10.33.2.0/24"
      az   = "sa-east-1c"
    }
  }
}

variable "australia-subnets" {
  type = map(map(string))
  default = {
    australia-a-public = {
      vpc  = "australia"
      cidr = "10.30.1.0/24"
      az   = "ap-southeast-2a"
    }
    australia-b-public = {
      vpc  = "australia"
      cidr = "10.30.2.0/24"
      az   = "ap-southeast-2b"
    }
  }
}

variable "hong-kong-subnets" {
  type = map(map(string))
  default = {
    hong-kong-a-public = {
      vpc  = "hong-kong"
      cidr = "10.52.1.0/24"
      az   = "ap-east-1a"
    }
    hong-kong-b-public = {
      vpc  = "hong-kong"
      cidr = "10.52.2.0/24"
      az   = "ap-east-1b"
    }
  }
}

variable "california-subnets" {
  type = map(map(string))
  default = {
    california-a-public = {
      vpc  = "california"
      cidr = "10.31.1.0/24"
      az   = "us-west-1a"
    }
    california-b-public = {
      vpc  = "california"
      cidr = "10.31.2.0/24"
      az   = "us-west-1b"
    }
  }
}

variable "virginia-subnets" {
  type = map(map(string))
  default = {
    virginia-a-public = {
      vpc  = "new-york"
      cidr = "10.51.1.0/24"
      az   = "us-east-1a"
    }
    virginia-b-public = {
      vpc  = "new-york"
      cidr = "10.51.2.0/24"
      az   = "us-east-1b"
    }
  }
}
resource "aws_vpc" "automation-demo"{
    cidr_block = var.cidr_block
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
        name = "automation-demo-vpc"
    }
}

resource "aws_subnet" "automation-demo-subnet"{
    vpc_id = aws_vpc.automation-demo.id
    cidr_block = var.subnet_cidr_block
    availability_zone = var.availability_zone
    map_public_ip_on_launch = true
    tags = {
        name = "automation-demo-subnet"
    }
}

resource "aws_internet_gateway" "automation-demo-igw"{
    vpc_id = aws_vpc.automation-demo.id
    tags = {
        name = "automation-demo-igw"
    }
}

resource "aws_route_table" "automation-demo-rt"{
    vpc_id = aws_vpc.automation-demo.id

    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.automation-demo-igw.id
    }
    tags = {
        name = "automation-demo-rt"
    }
}

resource "aws_route_table_association" "automation-demo-rta" {
    subnet_id = aws_subnet.automation-demo-subnet.id
    route_table_id = aws_route_table.automation-demo-rt.id
}
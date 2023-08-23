resource "aws_vpc" "main-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
}

resource "aws_subnet" "subnet-prod" {
  cidr_block = "${cidrsubnet(aws_vpc.main-vpc.cidr_block, 3, 1)}"
  vpc_id = "${aws_vpc.main-vpc.id}"
  availability_zone = "eu-west-3a"
}

resource "aws_security_group" "ingress-ssh" {
    name = "allow-ssh-sg"
    vpc_id = "${aws_vpc.main-vpc.id}"

    ingress {
        cidr_blocks = ["0.0.0.0/0"]

        from_port = 22
        to_port = 22
        protocol = "tcp"
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_internet_gateway" "prod-env-gw" {
    vpc_id = "${aws_vpc.main-vpc.id}"
}

resource "aws_route_table" "prod-env-rt" {
    vpc_id = "${aws_vpc.main-vpc.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.prod-env-gw.id}"
    }
}

resource "aws_route_table_association" "prod-env-rt-assoc" {
    subnet_id = "${aws_subnet.subnet-prod.id}"
    route_table_id = "${aws_route_table.prod-env-rt.id}"
}
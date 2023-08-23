resource "aws_spot_instance_request" "spot_worker" {
    ami = "ami-05b5a865c3579bbc4"
    spot_price = "0.016"
    instance_type = "t2.micro"
    spot_type = "one-time"
    # block_duration_minutes = 120
    wait_for_fulfillment = "true"
    key_name = "spot_key"

    security_groups = ["${aws_security_group.ingress-ssh.id}"]
    subnet_id = "${aws_subnet.subnet-prod.id}"
}
resource "aws_route53_zone" "terraform-zone" {
  name = "terraform-test.abiola-book.me"
  vpc {
    vpc_id = var.vpc_id
  }

}

resource "aws_route53_record" "first-record" {
  zone_id = aws_route53_zone.terraform-zone.zone_id
  name    = "first.terraform-test.abiola-book.me"
  type    = "A"
  ttl     = 300
  records = [aws_instance.first.public_ip]
}
resource "aws_route53_record" "second-record" {
  zone_id = aws_route53_zone.terraform-zone.zone_id
  name    = "second.terraform-test.abiola-book.me"
  type    = "A"
  ttl     = 300
  records = [aws_instance.second.public_ip]
}
resource "aws_route53_record" "third-record" {
  zone_id = aws_route53_zone.terraform-zone.zone_id
  name    = "third.terraform-test.abiola-book.me"
  type    = "A"
  ttl     = 300
  records = [aws_instance.third.public_ip]
}

#resource "aws_route53_record" "lb-record" {
# zone_id = aws_route53_zone.terraform-zone.zone_id
# name    = "terraform-test.abiola-book.me"
# type    = "A"
# ttl     = 300
# records = [aws_elb.terraform-test.dns_name]
#}
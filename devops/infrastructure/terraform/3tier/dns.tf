data "aws_route53_zone" "robkinyon" {
  name = "robkinyon.org"
}

resource "aws_route53_record" "web" {
  zone_id = "${data.aws_route53_zone.robkinyon.zone_id}"
  name    = "www.3tier.${data.aws_route53_zone.robkinyon.name}"
  type    = "A"

  alias {
    name                   = "${aws_alb.web.dns_name}"
    zone_id                = "${aws_alb.web.zone_id}"
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "api" {
  zone_id = "${data.aws_route53_zone.robkinyon.zone_id}"
  name    = "api.3tier.${data.aws_route53_zone.robkinyon.name}"
  type    = "A"

  alias {
    name                   = "${aws_alb.api.dns_name}"
    zone_id                = "${aws_alb.api.zone_id}"
    evaluate_target_health = true
  }
}

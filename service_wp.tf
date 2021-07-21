resource "aws_lb" "public_alb" {
    idle_timeout               = 60
    internal                   = false
    ip_address_type            = "ipv4"
    load_balancer_type         = "application"
    name                       = "public-alb"
    security_groups            = [
        aws_security_group.public_alb.id
    ]
    subnets                    = module.main_vpc.public_subnets
    access_logs {
        bucket  = "logs-${data.aws_caller_identity.current.account_id}"
        enabled = true
    }
}
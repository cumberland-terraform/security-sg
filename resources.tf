resource "aws_security_group" "this" {
  name                      = local.name
  description               = var.sg.description
  vpc_id                    = module.platform.network.vpc.id
  tags                      = local.tags

  lifecycle {
    ignore_changes        = [ tags ]
  }
}

resource "aws_security_group_rule" "inbound_rules" {
  for_each                  = { for index, rule in var.sg.inbound_rules:
                                  index => rule }

  security_group_id         = aws_security_group.this.id
  type                      = "ingress"
  from_port                 = each.value.from_port
  to_port                   = each.value.to_port
  protocol                  = each.value.protocol
  description               = try(each.value.description, null)
  cidr_blocks               = try(each.value.cidr_blocks, null)
  prefix_list_ids           = try(each.value.prefix_list_ids, null)
  self                      = try(each.value.self, null)
  source_security_group_id  = try(each.value.source_security_group_id, null)
}

resource "aws_security_group_rule" "outbound_rules" {
  type                      = "egress"
  security_group_id         = aws_security_group.this.id
  cidr_blocks               = [ "0.0.0.0/0" ]
  from_port                 = 0
  to_port                   = 0
  protocol                  = "-1"
}

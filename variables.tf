variable "platform" {
  description                   = "Platform metadata configuration object."
  type                          = object({
    client                      = string 
    environment                 = string
  })
}

variable "sg" {
  description                   = "Security group configuration. For each inbound rule object in the `inbound_rules` object, exactly one of the properties `cidr_blocks`, `prefix_list_ids`, `self` or `source_security_group_id` must be specifed. `suffix` is appended to end of the platform resource prefixes.`tags` is a list of arbitary key-value pairs that will be appended to default platform security group tags."
  type                          = object({
    inbound_rules               = list(object({
      from_port                 = number
      to_port                   = number
      protocol                  = string
      description               = optional(string, null)
      cidr_blocks               = optional(list(string), null)
      prefix_list_ids           = optional(list(string), null)
      self                      = optional(bool, null)
      source_security_group_id  = optional(string, null)
    }))
    suffix                      = optional(string, "")
    description                 = optional(string, null)
    tags                        = optional(list(object({
      key                       = string
      value                     = string
    })), null)
  })
}
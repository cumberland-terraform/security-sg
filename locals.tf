locals {
    name                = upper(join("-", [
                            "SG",
                            module.platform.prefix, 
                            var.sg.suffix
                        ]))
                            
    
    tags                = merge(try({ for tag in var.sg.tags: 
        tag.key         => tag.value 
    }, {}), { 
        Name            = local.name
    },module.platform.tags)
}
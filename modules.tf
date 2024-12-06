module "platform" {
  source                = "github.com/cumberland-terraform/platform"
  
  platform              = var.platform
  
  hydration             = {
    vpc_query           = true
    subnets_query       = false
    public_sg_query     = false
    private_sg_query    = false
    eks_ami_query       = false
    acm_cert_query      = false
  }
}

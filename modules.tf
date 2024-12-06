module "platform" {
  source                = "github.com/cumberland-terraform/platform"
  
  platform              = var.platform
  
  hydration             = {
    vpc_query           = true
  }
}

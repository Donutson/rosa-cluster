module "rosa" {
  source         = "../"
  AWS_KEY_ID     = var.AWS_KEY_ID
  AWS_SECRET_KEY = var.AWS_SECRET_KEY
  REDHAT_TOKEN   = var.REDHAT_TOKEN
}

module "s3-bucket" {
  source                           = "terraform-aws-modules/s3-bucket/aws"
  version                          = "3.15.1"
  bucket                           = "datastore-bucket-sagemake"
  attach_require_latest_tls_policy = true
}
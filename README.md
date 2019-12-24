# s3-user

Creates IAM User w/ Credentials for use with s3 Buckets

## Usage

```terraform
module "s3-user" {
  source  = "github.com/darkn3rd/s3-user"
  name    = var.name
  enabled = var.user_enabled ? true : false
  resources = [
    "${aws_s3_bucket.default.arn}/*",
    aws_s3_bucket.default.arn
  ]
  actions            = var.allowed_bucket_actions
  access_key_enabled = true
}
```

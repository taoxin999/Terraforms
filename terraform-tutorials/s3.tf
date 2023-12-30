# resource "aws_s3_bucket" "rds_s3_bucket" {
#   bucket = "test-tao-123"
#   # acl    = "private"
#   #   versioning {
#   #     enabled = true
#   #   }
# }

# resource "aws_s3_bucket_notification" "bucket_notification" {
#   bucket = aws_s3_bucket.rds_s3_bucket.id

#   eventbridge =  local.name_prefix == "tf_test" ? false : true
# }

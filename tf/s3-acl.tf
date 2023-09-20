resource "aws_s3_bucket_ownership_controls" "bucket-ownership-control" {
  bucket = data.aws_s3_bucket.selected-bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }

  depends_on = [aws_s3_bucket.bucket-1, data.aws_s3_bucket.selected-bucket]
}

resource "aws_s3_bucket_acl" "bucket-acl" {
  bucket = data.aws_s3_bucket.selected-bucket.id
  acl    = "private"

  depends_on = [aws_s3_bucket_ownership_controls.bucket-ownership-control]
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.bucket-1.bucket

  index_document {
    suffix = "index.html"
  }

  depends_on = [aws_s3_bucket.bucket-1, data.aws_s3_bucket.selected-bucket]
}

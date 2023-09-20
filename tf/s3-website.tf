resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.bucket-1.bucket

  index_document {
    suffix = "index.html"
  }
}

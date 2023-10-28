resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.bucket-1.bucket

  index_document {
    suffix = "index.html"
  }

  depends_on = [aws_s3_bucket.bucket-1, data.aws_s3_bucket.selected-bucket]
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.bucket-1.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = ["${aws_cloudfront_origin_access_identity.oai.iam_arn}"]
    }
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket-1.bucket
  policy = data.aws_iam_policy_document.s3_policy.json
}
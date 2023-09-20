resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.bucket-1.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.bucket-1.id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  default_cache_behavior {
    target_origin_id = aws_s3_bucket.bucket-1.id

    viewer_protocol_policy = "allow-all"
    allowed_methods        = ["GET", "HEAD", "OPTIONS"]

    cached_methods = ["GET", "HEAD"]
    compress       = true
    default_ttl    = 3600
    min_ttl        = 0
    max_ttl        = 86400

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn = var.cert_arn
    ssl_support_method  = "sni-only"
  }

  aliases = [var.domain_name]

  depends_on = [aws_s3_bucket.bucket-1, data.aws_s3_bucket.selected-bucket]
}


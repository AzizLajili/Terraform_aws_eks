resource "aws_s3_bucket" "web_bucket" {
  bucket = "eks-front-web-bucket"
  
  tags = {
    Name        = "eks-front-web-bucket"
    Environment = "test"
  }
  
}

resource "aws_s3_bucket_cors_configuration" "cors_configuration" {
    bucket = aws_s3_bucket.web_bucket.bucket
    
    cors_rule {
        allowed_headers = ["*"]
        allowed_methods = ["GET", "PUT", "POST", "DELETE", "HEAD"]
        allowed_origins = ["*"]
        expose_headers  = ["ETag"]
        max_age_seconds = 3000
    }
  
}

resource "aws_s3_bucket_website_configuration" "web_site_configuration" {
  bucket = aws_s3_bucket.web_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}
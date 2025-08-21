resource "aws_s3_bucket" "exemplo_s3" {
  bucket = "my-bucket-created-tf-25"
  tags = {
    Name = "Terraform Actions"
  }
}

resource "aws_s3_bucket_ownership_controls" "exemplo_s3" {
  bucket = aws_s3_bucket.exemplo_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "exemplo_s3" {
  depends_on = [aws_s3_bucket_ownership_controls.exemplo_s3]

  bucket = aws_s3_bucket.exemplo_s3.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "exemplo_s3" {
  bucket = aws_s3_bucket.exemplo_s3.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
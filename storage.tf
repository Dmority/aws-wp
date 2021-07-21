resource "aws_s3_bucket" "logs" {
    bucket = "logs-${data.aws_caller_identity.current.account_id}"
    server_side_encryption_configuration {
        rule {
            bucket_key_enabled = true
            apply_server_side_encryption_by_default {
                sse_algorithm     = "AES256"
            }
        }
    }
}
resource "aws_s3_bucket" "contents" {
    bucket = "contents-${data.aws_caller_identity.current.account_id}"
    server_side_encryption_configuration {
        rule {
            bucket_key_enabled = true
            apply_server_side_encryption_by_default {
                sse_algorithm     = "AES256"
            }
        }
    }

}
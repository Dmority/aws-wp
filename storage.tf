resource "aws_s3_bucket" "logs" {
    bucket = "logs-${data.aws_caller_identity.current.account_id}"
    server_side_encryption_configuration {
        rule {
            bucket_key_enabled = true
            apply_server_side_encryption_by_default {
                kms_master_key_id = "arn:aws:kms:ap-northeast-1:${data.aws_caller_identity.current.account_id}:alias/aws/s3"
                sse_algorithm     = "aws:kms"
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
                kms_master_key_id = "arn:aws:kms:ap-northeast-1:${data.aws_caller_identity.current.account_id}:alias/aws/s3"
                sse_algorithm     = "aws:kms"
            }
        }
    }

}
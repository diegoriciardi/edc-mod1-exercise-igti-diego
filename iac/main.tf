# HCL - Hashicorp Configuration Language
# Linguagem declarativa

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "datalake" {
  # parametros de configuracao do recurso escolhido
  bucket = "${var.base_bucket_name}-${var.ambiente}-${var.numero_conta}"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    IES   = "IGTI"
    CURSO = "EDC"
  }
}

resource "aws_s3_bucket_object" "codigo_spark" {
  bucket = aws_s3_bucket.datalake.id
  key    = "emr-code/pyspark/job_spark_from_tf.py"
  acl    = "private"
  source = "../job_spark_from_tf.py"
  etag   = filemd5("../job_spark_from_tf.py")
}

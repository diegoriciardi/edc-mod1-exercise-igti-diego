variable "base_bucket_name" {
  default = "datalake-dr-igti-ed-tf"
}

variable "ambiente" {
  default = "producao"
}

variable "numero_conta" {
  default = "128143350472"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "lambda_function_name" {
  default = "IGTIexecutaEMRaovivo"
}

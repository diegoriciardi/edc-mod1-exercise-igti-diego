variable "base_bucket_name" {
  default = "datalake-dr-igti-ed-tf"
}

variable "ambiente" {
  default = "producao"
}

variable "numero_conta" {
  default = "297587135663"
}

variable "aws_region" {
  default = "us-east-1"
}

variable "lambda_function_name" {
  default = "IGTIexecutaEMRaovivo"
}

variable "AmiLinux" {
  type = map
  default = {
    us-east-1 = "ami-0aa7d40eeae50c9a9" # N. Virginia
  }
  description = "have only added one region"
}

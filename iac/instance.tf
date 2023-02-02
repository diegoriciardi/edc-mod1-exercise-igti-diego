resource "aws_instance" "my-test-instance" {
  ami             = "${lookup(var.AmiLinux, var.aws_region)}"
  instance_type   = "m4.large"
  iam_instance_profile = "${aws_iam_instance_profile.emr_profile.name}"
}
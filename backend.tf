terraform {
  backend "s3" {
    bucket = "task1-tf-bucket"
    key = "tf.statefile"
    region = "us-east-1"
    dynamodb_table = "statefile.lock"
  }
}
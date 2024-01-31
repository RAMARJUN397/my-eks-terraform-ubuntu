terraform {
  backend "s3" {
    bucket = "arjunjenkinscicdeks"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}

terraform {
  backend "s3" {
    bucket         = "sampofobackendbucket"
    key            = "vprofile/basic"
    region         = "us-east-1"
    dynamodb_table = "statelockingterraform"
  }
}
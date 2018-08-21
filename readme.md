# Terraform
Messing around with Terraform, getting the hang of the app use. Software Defined Networks are the answer to managing complex infrastructure. Let's flex a little for the audience.

# Install
Go to the site download their latest package and drop it in your `/usr/local/bin`.

# Files
Files contained in the repo.

#### Example.tf
Contains the configuration to use for provisioning. Add the desired configuration in here and when ready run Terraform against it.
```shell
terraform init # installs providers modules
terraform apply # shows the possible changes and runs them
terraform show # shows the changes
```
[Tutorial](https://www.terraform.io/intro/getting-started/change.html)

#### terraform.tfstate
Keeps the state of the infrastructure, contains secret information not to be commited to vcp. Also, this file needs to be shared with anyone who is going to run Terraform prior to use. This file is how Terraform knows what it needs to do and must be kept in s3 and pulled before running. When using an automated build system the risk involved with over lap is greatly reduced. [Remote State](https://www.terraform.io/docs/state/remote.html)

# Lingo
Common Terms.

#### Providers
Providers are the owners of the APIs we interact with, ie: AWS, GCP, Github. This example is currently using one provider but will expand to use several as a more complete proof of concept is adapted.
_[Providers List can be found here](https://www.terraform.io/docs/providers/index.html)_

#### Dependencies
Resources sometimes depend on other resources to exist. Terraform can automatically infer when a resouce depends on another. Using a `depends_on` flag you can create an `explicit dependency` on something that is created in a context not visible to Terraform like inside of an s3 bucket which is created from within your application.
[Dependencies](https://www.terraform.io/intro/getting-started/dependencies.html)

#### Variables & Secrets Management
Using command line flags you can target different files for the secrets and the variables file. From an automation perspective this is amazing, we can run the same command to provision dev, staging, and prod.
```shell
$ terraform apply \
  -var-file="secret.tfvars" \
  -var-file="production.tfvars"
```

#### Multiple Instances
You can run the same module MANY TIMES!! OMG! >.<
```
# my_buckets.tf

module "assets_bucket" {
  source = "./publish_bucket"
  name   = "assets"
}

module "media_bucket" {
  source = "./publish_bucket"
  name   = "media"
}
```
OR!
```
# publish_ecs_service/ecs-service.tf

variable "instanceID" {} # this is the input parameter of the module
variable "clusterID" {} # this is the input parameter of the module

resource "ecs_service" "create" {
  # ...
}
# logic every 5 services
resource "ecs_service" "deploy_cluster" {
  # ...
}
```



#### List
Keep a list to run against
```
cidrs = [ "10.0.0.0/16", "10.1.0.0/16" ]
```

#### Map
The lookup function does a dynamic lookup in a map for a key. Spin up an instance on east, it will use the east AMI ID.
Example of using a map for secrets.
```
dbName = {
  "production" = "jenkinsProdDB"
  "development" = "jenkinsDevDB"
  "testing" = "jenkinsTestDB"
}

dbUserName = {
  "production" = "jenkinsProd"
  "development" = "jenkinsDev"
  "testing" = "jenkinsTest"
}

dbPassword = {
  "production" = "999999999999999999999999999"
  "development" = "8888888888888888888888"
  "testing" = "7777777777777777"
}
```

#### Output
You can create a block of code that will output variables that populate after run time like IPS, arns, pretty much anything the provider lists during the `terraform apply` operation. They are held in memory after run and accessible using `terraform output $variable`.

#### Modules
Organizing Terraform code into reusable parts. Sweet.

# Benefits
* Manage users on the entire infrastructure and related apps from one spot.
* Sync production and development - like literally not "kind of".
* Version control for infrastructure, you can git blame who broke the vpc, then quickly roll it back.
* Become truly provider agnostic and whack your sales rep over the head with a really big stick!

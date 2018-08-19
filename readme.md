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


# Benefits
* Manage users on the entire infrastructure and related apps from one spot.
* Sync production and development - like literally not "kind of".
* Version control for infrastructure, you can git blame who broke the vpc, then quickly roll it back.
* Become truly provider agnostic and whack your sales rep over the head with a really big stick!

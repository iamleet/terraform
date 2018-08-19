# Terraform
Messing around with Terraform, getting the hang of the app use. Software Defined Networks are the answer to managing complex infrastructure. Let's flex a little for the audience.

# Install
Go to the site download their latest package and drop it in your `/usr/local/bin`.

# Example.tf
Contains the configuration to use for provisioning. Add the desired configuration in here and when ready run Terraform against it.
```shell
terraform init # installs providers modules
terraform apply # shows the possible changes and runs them
terraform show # shows the changes
```
## Providers
This example is currently using one provider but will expand to use several as a more complete proof of concept is adapted.
_[Providers List can be found here](https://www.terraform.io/docs/providers/index.html)_


# Benefits
* Manage users on the entire infrastructure and related apps from one spot.
* Sync production and development - like literally not "kind of".
* Version control for infrastructure, you can git blame who broke the vpc, then quickly roll it back.

# Terraform Counter Strike 1.6
### Terraform script for installing counter strike 1.6 server in docker.

---
## How it works?

Terraform script installs instance in aws. Docker is installed on the instance and the Conter Strike 1.6 server is launched in a container. The container is already ready and take it from [here](https://hub.docker.com/r/febley/counter-strike_server/)

---


### Important!
On macbook with M1\M2 cpu ***templatefile*** in ***userdata*** in ./modules/aws-instance/instance.tf may not work.


**To do this, you need to install additional packages:**
```bash
brew install kreuzwerker/taps/m1-terraform-provider-helper
m1-terraform-provider-helper activate
m1-terraform-provider-helper install hashicorp/template -v v2.2.0
```
---


### Terraform script structure:
```
.
├── README.md
├── main.tf - main file to run
├── modules - directory with modules
│   ├── aws-instance 
│   │   ├── instance.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── aws-private-key
│   │   ├── aws-private-key.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   ├── aws-s3
│   │   ├── outputs.tf
│   │   ├── s3.tf
│   │   └── variables.tf
│   ├── aws-sg
│   │   ├── outputs.tf
│   │   ├── sg.tf
│   │   └── variables.tf
│   └── aws-vpc
│       ├── outputs.tf
│       └── vpc.tf
├── outputs.tf - outputs with server address, server port and bucket name for states
├── provider.tf - providers here
├── userdata.tpl - script with docker and server installation in a container
└── variables.tf - main variable file
```


---
**To run scripts you need:**
```bash
git clone git@github.com:lemegOPS/terraform_cs_server.git
cd terraform_cs_server
terraform init
terraform apply
```


---
**After installing the server, the script will give output:**

**Example**:
> bucket_name = "games-small-cs1.6-server-tfstate-x9uq69"\
> game_port = "27015"\
> private_key_name = "Games_small_CS1.6_server_SSH-key"\
> server_ip = "some_uplic_ip"


---
**After successful creation of the server, a private ssh key with the name of the pattern *Project_Size_Name*_SSH-key.pem will appear in the directory with scripts. To connect to the server, use the command:**
```bash
ssh -i you_generated_ssh_key.pem ec2-user@ip_from_output
```
---


**Everything is controlled from the variables.tf file in the root module.**
**Below is a description of the variables:**
|Variable Name|Variable Value|
|-------------|--------------|
|variable "profile"|Value from ~/.aws/config. [How_to_config](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-quickstart.html#getting-started-quickstart-new-command)|
|region| Choose the right region|
|tags|From tags, a long name of all tags, a bucket according to the pattern, is formed: *Project_Size_Name* in *local* *global_name* of main.tf file|
|instance_type|Depending on what is specified in *tags* *Size*, the instance type is selected|
|ami_image|Filters can be anything. [Filter examples](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami)|
|sec_group|Ports, internals and networking of the server. *port_udp* is forwarded in userdata.tpl to container ports.|


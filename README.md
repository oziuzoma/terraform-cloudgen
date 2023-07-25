WordPress is a popular and widely used content management system (CMS) that allows users to create and manage websites and blogs. It has a flexible architecture that combines core functionalities with plugins and themes to provide a customizable and extendable platform. 

Architecture is a two-tier application a web server front-end deployed as a kubernetes deployment and a Maria DB stateful set.
Network policy resticts ingress traffic to the MariaDB pod (controlled by stateful set) to only the frontend webserver pod.

Pre-requisites
Install kubectl, kubectx and kubens, terraform, aws cli.

Export your AWS access and secret access keys in your terminal

To deploy the clone the repo and run these commands.
cd terraform
terraform init 
terraforn plan
terraform apply 

Export the cluster kube-config into your ~/.kube/config
aws eks update-kubeconfig --region us-east-1 --name ozi-cluster

Change context and apply the network policy to the cluster
kubetcl apply -f policy.yaml

Clean Up Steps
terraform destroy

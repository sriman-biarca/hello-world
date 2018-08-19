# These are the variables that control global resources for
# the portal are configured within GCE. 

# See variables.tf for descriptions of each of the variables
# used below.

#--------------------------------------------------------------
# General
#--------------------------------------------------------------

cluster_name        	= "cicddemo-cluster"
IMAGE_PATH          	= "gcr.io\\/temp-195907\\/bitbucket-sriman_biarca-cicd:2cfc78f8c34116efd2acdbcc24e489a709151c40"
master_auth_user    	= "biarca"
master_auth_pswd    	= "biarcasecretpassword"
project_name        	= "temp-195907"
REPLICA_COUNT       	= "2"
network     		= "default
static_ip_name      	= "cicdservice-ip"
static_ip_count     	= "1"
ssh_key_public_path    	= "~/.ssh/id_rsa.pub"
ssh_key_private_path   	= "~/.ssh/id_rsa"
user_name           	= "biarca"

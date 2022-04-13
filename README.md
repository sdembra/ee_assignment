# ee_assignment
#Implementation details:

This repository contains terraform modules to create vpc,public_subnets,private_subnets,security_groups,route_table,route_table_associations.
Above modules have been invoked in network.tf.


ssh_key.tf and jenkins.tf are for creating ssh key and jenkins instance respectively.
Have used user-data to install jenkins.

Note: have opened port 22 and 8080 for 0.0.0.0/0 for temporary sake. We can modify it to accept our public IP in ee.tfvars and open these ports only for our public IP.

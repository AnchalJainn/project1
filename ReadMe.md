•Use the Master VM for Jenkins, Ansible, GIT etc.
•Use the fresh instance for Jenkins Slave Node (Test Server)
•Change the IP address of the VMs accordingly
•Add Build Pipeline Plugin and Post-build task plugin to Jenkins on the master VM
•Install python, openssh-server and git on the slave node manually
•Use the image devopsedu/webapp and add your PHP website to it using a Dockerfile
•Push the PHP website, and the Dockerfile to a git repository

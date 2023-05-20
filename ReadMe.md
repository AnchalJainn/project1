# edureka-project-1
AppleBite

Steps for executing the solution:
- Use the Master VM for Jenkins, Ansible, GIT etc.
- Use the fresh instance for Jenkins Slave Node (server where docker will be installed, containers will be executed etc.)
- Add Build Pipeline Plugin and Post-build task plugin to Jenkins on the master VM
- Install python, openssh-server and git on the slave node manually
- Use the image devopsedu/webapp and add your PHP website to it using a Dockerfile
- Push the PHP website, and the Dockerfile to a git repository
- When any commit received pipeline job will be automatically triggered

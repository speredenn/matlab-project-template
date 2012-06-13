# MathWorks MATLAB project template

This is my folder skeleton for MathWorks MATLAB projects.

## Create a new project
	- git clone https://github.com/speredenn/matlab-project-template.git [new-project-name]
	- cd [new-project-name]
	- make init
	- OPTIONAL: git remote add origin [git-repo] (in that case, on the server, you need to create the repository with git init --bare)
	- OPTIONAL, if dependencies: git submodule add -b master [git-repo-dependency] deps/[dependency-name]
	- git push -u origin master
	
## Upgrade the dependencies
	- make upgrade-deps

## when code is ready...
	- make deploy

## To run the code
	- make

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
  </ol>
</details>


<!-- ABOUT THE PROJECT -->
## About The Project

<!-- [![Product Name Screen Shot][product-screenshot]](https://example.com)-->
This HomeLab was created to test out new IaC Tools and play with Docker and Orchestration. This is a Sanbox for privately testing new software or code!

Here's why:
* Getting started wioth DevOps principles like: IaC, Automation, Deployment, Containerization,...
* You shouldn't be doing the same tasks over and over in order to test new things in different VMs

In the future i plan to add a Github actions Pipeline to at firs act as a Linter. A Proper CI/CD pipe? maybe


### Built With

Here are a few Tools used in the making of this HomeLab.

* Vagrant
* Ansible
* Docker
* Docker swarm
* Apache2


<!-- GETTING STARTED -->
## Getting Started

This project by the configuration that is set up at the Moment will:

1. Use Vagrant to create 3 VMs (1x Controller and 2x Worker VMs) <br> 
   Set up the Image, hostname, SSH, Port fowarding, Foldersyncing
2. Configure the VMs with Ansible (install software, i.e Docker, Apache2)
3. A dummy Flask Docker Container that is deployed by Docker swarm to all VMs 
4. Locally host a Test website

### Prerequisites

This is a list of how to things you need to use the software and how to install them.
* Virtualbox
  ```sh
  sudo apt install virtualbox virtualbox-ext-packwd
  ```
* Vagrant
  ```sh
  sudo apt install vagrant
  ```
  Every other needed Software will be installed by Ansible inside of the VMs


### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/Huerkan-Utan/devops-projekt.git
   ```
2. Navigate to the Folder inside of your Terminal 
   ```
   cd ../devops-projekt
   ```
3. Initialise Vagrant and run it
   ```Vagrant
   vagrant init && vargrant up
   ```
For any other reference on how to use Vagrant and Docker swarm please reference [here](https://cheatography.com/davbfr/cheat-sheets/vagrant-cheat-sheet/).
for Vagrant and [here](https://github.com/sematext/cheatsheets/blob/master/docker-swarm-cheatsheet.md) for Docker swarm

<!-- USAGE EXAMPLES -->
## Usage
This Repo is used as a Template HomeLab to locally test new technologies and tools and have fun. You are free to change up the Configuration as you wish as this was a fun little learning Project

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

- [x] Create HomeLab for testing with IaC Vagrant
- [x] configure the VM's with Ansible and install Docker and Apache and git 
- [x] Try out Docker with (i.e a Flask app)
- [x] Deploy the Dockerized application with Docker swarm onto multipe VM's
- [ ] Dockerize my website hosting
- [ ] fix Current Docker swarm worker Node issues!!
- [ ] Get League of legends working in a container in regards to security

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Issue fixing
--- 
# description
Once you run ` vagrant halt ` and gracefully stop the HomeLab and try to start it back up again all but the first VM1 is not reachable. 
---
steps taken to resolve this: <br>
1. SSH into the VM and leave the Docker swarm by running ` docker leave swarm `
2. Run the docker swarm playbook to re add the VMs as a worker
3. re create the Application by running `docker stack deploy --compose-file docker-compose APPNAME`
4. scale the Service and now its on the worker nodes as well

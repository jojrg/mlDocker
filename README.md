# mlDocker - A MarkLogic Cluster hosted on Docker 


### Preparation Tasks

Please refer to `http://docs.docker.com` for installing docker and to get started with docker.
I recommend the getting started sections (`http://docs.docker.com/mac/started/` or `http://docs.docker.com/mac/started/` for mac and windows) for a quick start and installation of the docker toolbox including docker, docker-machine, docker-compose, virtual-box etc. 

See [Dockerfile](Dockerfile) for details, on how to build a docker image and spin up a docker container with a MarkLogic 8 server. You will also find information
about which network ports are exposed for this demo application. The Dockerfile presumes that `MarkLogic-8.0-3.x86_64.rpm` is located in the same directory as the dockerfile.


### Installation Process

1. Build the docker image using the `Dockerfile`.

2. Use docker-compose and its confoguration file docker-compose.yml in order to spin up three docker containers each running MarkLogic

3. Use MarkLogic Management API (or MarkScript) to setup the cluster by installing a standalone marklogic server in the one container and adding the two MarkLogic servers to the cluster.
 
4. Bootstrap an application and configure high availability with forest-failover  

The folder `roxyApp` contains a roxy project. It is used to bootstrap a base application (including a content and modules database) in MarkLogic:
 * Edit the property file under `roxyApp/deply/local.properties` and set the `bootstrap-server` property to the IP of your docker host (docker machine) that hosts the marklogic containers.
 * Run the following commads:
 ** `./ml local bootstrap`
 ** `./ml local bootstrap --replicate-internals`


### more to come - this is still under construction.

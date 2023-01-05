# ci_setup
Docker setup for continuous integration server for nodejs application

## Architecture

The setup has the following components (all running in their own docker container):
- (apache) An ***Apache** web server acting as a proxy to the external world. It is responsible for passing request to other containers.
- (apache_ssl) Same as the (apache) container but can be configured to use ssl with letsencrypt.
- (mongodb) A container running a ***mongodb** instance.
- (jenkins) A container running **jenkins**. This container is responsible for the CI/CD setup. It has a Jenkinsfile that is configured to download a nodejs source repository, build it, test it, and deploy it to the (blockly_development) container
- (blockly_development) A nodejs container for running the application.
- (blockly_staging) same as (blockly_development but for staging branch)


## Usage

- Run deploy.sh in the root directory of this repository.
- Update the /jenkins/Jenkinsfile to suit your CI/CD needs.
- Access jenkins on [hostname]:8081/jenkins.
- Create a new ***pipline** in jenkins.
- In the configuration menu under **Pipeline** select **Pipeline from SCM**.
- Add the referenct to this repo (f.e. https://github.com/dwengovzw/ci_setup.git).
- Set script path to *jenkins/Jenkinsfile*
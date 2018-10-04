# Build a docker base image for any Java or Scala service using newrelic and aws service
The `Dockerfile` does common tasks required for running a Java or Scala service in AWS ECS.  These tasks take a while.  Defining a docker file for the base image saves the time from repeating the tasks for different application services.  The tasks are:
* Downloading the base Java docker image
* Downloading and configuring the license for newrelic
* Installing python3-pip for upgrading awscli such that the container can run aws command such as downloading file from s3, etc to setup the environment required to run the service

## Build the docker base image
```
docker build -t base_image_tag_name --build-arg NEWRELIC_LICENSE=theLicenseKey .
```

To use the base image, specifies command `FROM base_image_tag_name` in the docker file of the container that runs the application service.





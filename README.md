# Flask-Docker-App

Example python project.

The project shows how to build a container with a python service, build a helm chart for it,
test and scan for vulnerabilities, publish reports, set dynamic variables, pass variables between stages,
publish containers and helm charts to a registry and test them in a separate stage.

Prerequisites: 
* container runtime - docker, podman
* helm
* k8s cluster running

## Local set up & installation

Build container: 

```bash
docker build -t python-example:1.0.0 .
```

Run container locally: 

```bash
docker run -p 5000:5000 python-example:1.0.0 
```

Test running container: `curl http://localhost:5000`

Expected result: "Hello from Flask & Docker"

## Container and Helm commands

The application container is built and published to a container registry. The helm chart is built and published to a helm repositiry.

Pull container image: `podman pull REGISTRY/python-example:1.0.123`

Helm registry login: `helm registry login -u $USER -p $PASS $REGISTRY`

Helm add repo: `helm repo add apprepo https://$REGISTRY/helm/v1/repo --username $USER --password $PASS`

Pull chart: `helm pull oci://$REGISTRY/helm/python-example`

## Deployment to k8s


Install helm release:

```bash
helm install python-example oci:///$REGISTRY/helm/python-example \
    --namespace python-example \
    --atomic --create-namespace --debug \
    --username $USER --password $PASS
```

Test helm release: `helm test python-example --namespace python-example`

Delete helm release: `helm delete python-example --namespace python-example`

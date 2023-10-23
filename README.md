# Docker image for CockroachDB on Ubuntu

This is a minimal Docker image running CockroachDB on Ubuntu. It has the same endpoint.sh script as the image published by Cockroach Labs on Docker Hub. So the usage of this image is the same.

## Usage

### Clone the repo
```
git clone https://github.com/sheaffej/crdb-ubuntu-docker.git
cd crdb-ubuntu-docker
```

### Build the image
There is one ARG (CRDB_VERSION) which is the version of the CockroachDB binary to download from `www.cockroachlabs.com`. Note that the version is prefix with the letter v, as in `v22.2.14`.
```
docker build --build-arg CRDB_VERSION=v22.2.14 -t my_crdb_image .
```
Change `my_crdb_image` to whatever image name you wish.

### Trivy scan the created image
If you wish to scan the image with Trivy for vulnerabilities, simply run this command after the build step.
```
trivy image hpe my_crdb_image
```
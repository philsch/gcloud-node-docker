gcloud-node-docker
==================

Docker image combining the Google Cloud SDK and nodeJS.

## How to use this image

Reference the [public image](https://hub.docker.com/r/philsch333/gcloud-node) `philsch333/gcloud-node` for 
example in your CI/CD pipeline.

**Bitbucket pipeline**

```
image: philsch333/gcloud-node

pipelines:
  branches:
    master:
      - step:
        script:
            - ...
```

## Supported tags and respective Dockerfile links

Tags are following the pattern `<gcloud version>(-<variant>)-node<nodeJS version>`:

```
362-slim-node14
362-slim-node14.18
362-slim-node14.18.1
362.0-slim-node14
362.0-slim-node14.18
362.0-slim-node14.18.1
362.0.0-node14
362.0.0-node14.18
362.0.0-node14.18.1
362.0.0-node16
362.0.0-node16.13
362.0.0-node16.13.0
362.0.0-slim-node14
362.0.0-slim-node14.18
362.0.0-slim-node14.18.1
362.0.0-slim-node16
362.0.0-slim-node16.13
362.0.0-slim-node16.13.0
```

gcloud-node-docker
==================

Docker image combining the Google Cloud SDK and nodeJS.

# Why this image?

This docker image can be useful if you have a combined nodeJS build and deploy to Google Cloud step in your CI/CD pipeline.

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

## Supported tags

Tags are following the pattern `<gcloud version>(-<variant>)-node<nodeJS version>`. For Example:

```
362-node14
362-node14.18
362-node14.18.1
362-slim-node14
362-slim-node14.18
362-slim-node14.18.1
362.0-node14
362.0-node14.18
362.0-node14.18.1
362.0-slim-node14
362.0-slim-node14.18
362.0-slim-node14.18.1
362.0.0-node14
362.0.0-node14.18
362.0.0-node14.18.1
362.0.0-slim-node14
362.0.0-slim-node14.18
362.0.0-slim-node14.18.1
```

You can pin a specific version by using the full semantic version.
Please see the [complete tag list](https://hub.docker.com/r/philsch333/gcloud-node/tags) on Docker Hub.

## License

The content of this repository is licensed under [MIT License](./LICENSE).

As with all Docker images, these likely also contain other software which may be under other licenses (such as Bash, etc from the base distribution, along with any direct or indirect dependencies of the primary software being contained).

As for any pre-built image usage, it is the image user's responsibility to ensure that any use of this image complies with any relevant licenses for all software contained within.

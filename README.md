# Dwolla Java Base Image, with New Relic’s Java agent

Starting from Dwolla’s [`dwolla/java:8`](https://github.com/Dwolla/docker-java/blob/master/Dockerfile) image, the `Dockerfile` adds New Relic’s Java agent in `/opt/newrelic`.

## Dependencies
1. Run bundler to install any needed gems.

        bundle install
2. `DOCKER_HOST` must point to a valid Docker instance.

## Test and Build

    rake

## Publish

    rake publish

Set the `DOCKER_REPOSITORY` environment variable to publish to a repository other than the default ([docker.sandbox.dwolla.net](https://docker.sandbox.dwolla.net/ui)).

## Clean

    rake clean

Removes the image and any test artifacts which also might be added to your local Docker repository.

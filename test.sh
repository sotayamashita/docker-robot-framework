#!/bin/bash

main() {
  # Build docker image
  docker build --tag behivee/robot-framework .

  # Run a `robot` command in a new container
  docker run --rm -ti \
    -v "$PWD/suites":/home/robot/suites \
    -v "$PWD/reports":/home/robot/reports \
    behivee/robot-framework
}

main "$@"

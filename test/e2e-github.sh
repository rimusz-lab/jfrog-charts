#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

main() {

    if [ -n "${GCLOUD_GKE_CLUSTER:-}" ]; then
      echo "Running from branch in GKE..."
      echo
      test/e2e-gke.sh
    else
        echo "Running from fork in Minikube..."
        echo
        test/e2e-minikube.sh
    fi

    echo "Done Testing!"
}

main

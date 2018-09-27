#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

main() {

    if [ -z "$GCLOUD_GKE_CLUSTER" ]; then
        echo "Running from fork in Minikube..."
        echo
        test/e2e-minikube.sh
    else
        echo "Running from branch in GKE..."
        echo
        test/e2e-gke.sh
    fi

    echo "Done Testing!"
}

main

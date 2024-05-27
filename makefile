lint:
	podman run -it --network host --workdir=/data --volume ~/.kube/config:/root/.kube/config:ro --volume ./:/data quay.io/helmpack/chart-testing:v3.11.0 ct lint --all

test:
	podman run -it --network host --workdir=/data --volume ~/.kube/config:/root/.kube/config:ro --volume ./:/data quay.io/helmpack/chart-testing:v3.11.0 ct install --target-branch main --helm-extra-set-args="--set=domain=https://warden.example.com:8443"

.PHONY: lint test
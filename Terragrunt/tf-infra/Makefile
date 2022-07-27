.ONESHELL:

SHELL=/bin/bash

plan-staging-gcs:
	echo "Planning Core for core-infra";
	terragrunt plan \
	  --terragrunt-working-dir "projects/staging/gcs-staging-bucket/"

plan-bootstrap:
	@echo "Applying Core for bootstrap";
	terragrunt plan  \
	  --terragrunt-working-dir projects/bootstrap \
	  --terragrunt-non-interactive

plan-common-network:
	@echo "Applying Core for bootstrap";
	terragrunt run-all plan  \
	  --terragrunt-working-dir projects/common/net-host-prj \
	  --terragrunt-non-interactive

test-plan:
	@echo "Applying Core for bootstrap";
	terragrunt run-all plan  \
	  --terragrunt-working-dir projects/common \
	  --terragrunt-non-interactive

test-apply:
	@echo "Applying Core for bootstrap";
	terragrunt run-all apply  \
	  --terragrunt-working-dir projects/common \
	  --terragrunt-non-interactive

apply-common-network:
	@echo "Applying Core for bootstrap";
	terragrunt run-all apply  \
	  --terragrunt-working-dir projects/common/net-host-prj \
	  --terragrunt-non-interactive

apply-bootstrap:
	@echo "Applying Core for bootstrap";
	terragrunt apply  \
	  --terragrunt-working-dir projects/bootstrap \
	  --terragrunt-non-interactive

destroy-all-net-prj:
	echo "Destroying Landing Zones for nonp";
	terragrunt run-all destroy \
	  --terragrunt-working-dir ./projects/common/net-host-prj \
	  --terragrunt-non-interactive \
	  --terragrunt-ignore-external-dependencies
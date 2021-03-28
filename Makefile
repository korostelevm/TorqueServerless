.EXPORT_ALL_VARIABLES:
BUCKET = $(shell aws ssm get-parameter --name /account/app-bucket | jq -r .Parameter.Value)
version = $(shell git rev-parse HEAD | cut -c1-8)
date = $(shell date '+%Y-%m-%d')
app_name = AIVA-DevOps
ACCOUNT = $(shell aws sts get-caller-identity | jq --raw-output .Account)
ECR_REPO = pandoc-release-notes-lambda

.PHONY: create_repositiry
create_repository: 
	aws ecr create-repository --repository-name $$ECR_REPO --image-scanning-configuration scanOnPush=true

.PHONY: build
build: 
	@sam build

.PHONY: test
test: 
	bash test.sh

.PHONY: package
package: build
	@sam package --s3-bucket ${BUCKET} --s3-prefix ${app_name}/${date}/${version} --image-repository $$ACCOUNT.dkr.ecr.us-east-1.amazonaws.com/$$ECR_REPO

.PHONY: deploy
deploy: 
	@sam deploy \
		--s3-bucket ${BUCKET} --s3-prefix ${app_name}/${date}/${version} \
		--image-repository $$ACCOUNT.dkr.ecr.us-east-1.amazonaws.com/$$ECR_REPO \
		--stack-name AIVA-DevOps \
		--capabilities CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND \
		--no-fail-on-empty-changeset --tags logical_name=AIVA-DevOps
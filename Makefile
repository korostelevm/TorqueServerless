.EXPORT_ALL_VARIABLES:
BUCKET=$(shell aws ssm get-parameter --name /account/app-bucket | jq -r .Parameter.Value)
version = $(shell git rev-parse HEAD | cut -c1-8)
date = $(shell date '+%Y-%m-%d')
app_name = TorqueServerless


.PHONY: test
test: 
	@echo ${BUCKET}

.PHONY: build
build: 
	@rm -rf .aws-sam
	@sam build

.PHONY: package
package: build
	@sam package --s3-bucket ${BUCKET} --s3-prefix ${app_name}/${date}/${version}

.PHONY: deploy
deploy: 
	@sam deploy \
		--s3-bucket ${BUCKET} --s3-prefix ${app_name}/${date}/${version} \
		--stack-name ${app_name} \
		--capabilities CAPABILITY_NAMED_IAM CAPABILITY_AUTO_EXPAND \
		--no-fail-on-empty-changeset --tags logical_name=${app_name}
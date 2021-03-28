.EXPORT_ALL_VARIABLES:
BUCKET=$(shell aws ssm get-parameter --name /account/app-bucket | jq -r .Parameter.Value)
version = $(shell git rev-parse HEAD | cut -c1-8)
date = $(shell date '+%Y-%m-%d')
app_name = TorqueServerless


.PHONY: install
install: 
	@cd service && npm install
	@cd vue && npm install

.PHONY: test
test: 
	@echo ${BUCKET}

.PHONY: local
local: 
	@open http://localhost:1111
	@cd vue && node ./node_modules/@vue/cli-service/bin/vue-cli-service.js serve --port 1111

.PHONY: frontend
frontend: 
	@cd vue && npm run build
	@aws s3 cp ./vue/dist s3://torque.coldlambda.com --recursive  

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
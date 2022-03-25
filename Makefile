ECR_REPO = 550346457415.dkr.ecr.eu-central-1.amazonaws.com/veinito
ECR_TAG = latest
AWS_REGION = eu-central-1

build:
	docker build -t ${ECR_REPO}:${ECR_TAG} .

docker/login:
	aws --region ${AWS_REGION} ecr get-login-password | docker login --username AWS --password-stdin $(ECR_REPO)

docker/push:
	docker push $(ECR_REPO):$(ECR_TAG)
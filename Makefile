AWS_REGION = eu-central-1
REPO = 550346457415.dkr.ecr.${AWS_REGION}.amazonaws.com/veinito
TAG = 3

build:
	docker build -t ${REPO}:${TAG} .

docker/login:
	aws --region ${AWS_REGION} ecr get-login-password | docker login --username AWS --password-stdin ${REPO}

docker/push:
	docker push ${REPO}:${TAG}
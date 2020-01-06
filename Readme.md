```shell script
docker run -itd --name docker-aws-cli itkos/docker-aws-cli
docker exec -ti docker-aws-cli /bin/sh

export AWS_ACCESS_KEY_ID="..."
export AWS_SECRET_ACCESS_KEY="..."
aws --region eu-central-1 eks update-kubeconfig --name eks-production

kubectl config set-context --current --namespace="..."

docker stop docker-aws-cli
```
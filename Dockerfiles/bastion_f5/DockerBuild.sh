image_name=bastion_f5

docker stop ${image_name}_temp
docker rm ${image_name}_temp
docker build -t ${mage_name}_rebuild .
docker tag ${image_name}_rebuild azuredockerregistery.azurcr.io/${image_name}:latest

docker push azuredockerregistery.azurecr.io/${image_name}:latest
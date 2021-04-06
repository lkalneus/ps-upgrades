if [ $# -eq 0 ]
  then
    echo "Usage: push-the-image.sh {version} {image_name}"
fi
registry=cenmdemo.azurecr.io
[ -z "$1" ] && ":"$1 || version=":latest"
[ -z "$2" ] && name=$registry"/demo"$version || name=$registry"/"$2$version
echo $name
docker build -t $name .
docker push $name
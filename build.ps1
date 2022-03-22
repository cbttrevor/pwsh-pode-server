$Registry = 'registry.digitalocean.com/cbtnuggets'
$Tag = 'pode-server'
$RemoteTag = '{0}/{1}' -f $Registry, $Tag

docker build --tag $Tag $PSScriptRoot
docker tag $Tag $RemoteTag
docker push $RemoteTag
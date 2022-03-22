# NOTE: Run this script to build the project and push it to a remote registry.
#       You must already be authenticated to the remote registry.

$Registry = 'registry.digitalocean.com/cbtnuggets'
$Tag = 'pode-server'
$RemoteTag = '{0}/{1}' -f $Registry, $Tag

docker build --tag $Tag $PSScriptRoot
docker tag $Tag $RemoteTag
docker push $RemoteTag
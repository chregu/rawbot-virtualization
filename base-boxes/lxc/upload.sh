USERNAME=drifter
VERSION=0.0.3
BOX_NAME="liip-jessie64-lxc"
PROVIDER_NAME="lxc"

curl https://atlas.hashicorp.com/api/v1/box/drifter/$BOX_NAME/versions \
        -X POST \
        -d version[version]="$VERSION" \
        -d access_token=$ATLAS_TOKEN

curl https://atlas.hashicorp.com/api/v1/box/drifter/$BOX_NAME/version/$VERSION/providers \
-X POST \
-d provider[name]='lxc' \
-d access_token=$ATLAS_TOKEN

URL="https://atlas.hashicorp.com/api/v1/box/${USERNAME}/$BOX_NAME/version/$VERSION/provider/$PROVIDER_NAME/upload?access_token=$ATLAS_TOKEN"
echo "***"
echo $URL
echo "***"

OUTPUT=$(curl $URL)

UP_PATH=$(echo $OUTPUT | sed 's/.*"upload_path":"\([^"]*\)".*/\1/g')
#UP_TOKEN=$(echo $OUTPUT | sed 's/.*"token":"\(.*\)".*/\1/g')
echo "***"
echo $UP_PATH
echo "***"

curl -X PUT --upload-file package.box $UP_PATH


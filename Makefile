NAME =                  yunohost
VERSION =               latest
VERSION_ALIASES =       1.0.0 1.0 0
TITLE =                 Yunohost
DESCRIPTION =           Yunohost on Debian Jessie
DOC_URL =
SOURCE_URL =            https://github.com/scaleway-community/yunohost-scaleway
VENDOR_URL =
DEFAULT_IMAGE_ARCH =	x86_64


IMAGE_VOLUME_SIZE =     50G
IMAGE_BOOTSCRIPT =      
IMAGE_NAME =            yunohost

## Image tools  (https://github.com/scaleway/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - https://j.mp/scw-builder | bash
-include docker-rules.mk

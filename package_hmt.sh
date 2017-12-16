#!/bin/bash

if [[ -z ${1+x} ]]; then
  echo 'Missing argument (version number)'
  echo 'Usage: bash package.sh 3.1.18'
  exit
fi

VERSION=$1 # folder name is version number e.g. 3.1.8 (heatmaptracker/3.1.8)
PROJECT_ROOT=~/code/hmt/
APP=heatmaptracker
SAVE_PATH=${PROJECT_ROOT}/lib_code/versioning/versions/${VERSION}/

# AGENCY LICENSE
SAVE_DIR_NAME=hmt-agency-license
SAVE_DIR=${SAVE_PATH}${SAVE_DIR_NAME}
mkdir -p ${SAVE_DIR}
rsync -av --progress --exclude .git --exclude .gitignore --exclude .gitattributes --exclude .idea --exclude config.php ${PROJECT_ROOT}/${APP}/ ${SAVE_DIR}
# cd to save path and set permissions
cd ${SAVE_PATH}
find ${SAVE_DIR_NAME} -type d -exec chmod 755 {} \;
find ${SAVE_DIR_NAME} -type f -exec chmod 644 {} \;

zip -r  ${SAVE_DIR}.zip ${SAVE_DIR_NAME}
if [ -f ${SAVE_DIR}.zip ]; then
   echo " "
   echo " -> Done: archive ${SAVE_DIR_NAME}.zip has been created!"
   echo " "
else
   echo " "
   echo " -> FAILED: archive ${SAVE_DIR_NAME}.zip WAS NOT CREATED!"
   echo " "
fi

# BASIC LICENSE
SAVE_DIR_NAME=hmt-basic-license
SAVE_DIR=${SAVE_PATH}${SAVE_DIR_NAME}
mkdir -p ${SAVE_DIR}
rsync -av --progress --exclude agency --exclude .git --exclude .gitignore --exclude .gitattributes --exclude .idea --exclude config.php ${PROJECT_ROOT}/${APP}/ ${SAVE_DIR}
# cd to save path and set permissions
cd ${SAVE_PATH}
find ${SAVE_DIR_NAME} -type d -exec chmod 755 {} \;
find ${SAVE_DIR_NAME} -type f -exec chmod 644 {} \;

zip -r  ${SAVE_DIR}.zip ${SAVE_DIR_NAME}
if [ -f ${SAVE_DIR}.zip ]; then
   echo " "
   echo " -> Done: archive ${SAVE_DIR_NAME}.zip has been created!"
   echo " "
else
   echo " "
   echo " -> FAILED: archive ${SAVE_DIR_NAME}.zip WAS NOT CREATED!"
   echo " "
fi

echo "Next step is to update the changelog and version in create_update_files.php and then run it (php create_update_files.php) "

exit;

#!/bin/bash

if [[ -z ${1+x} || -z ${2+x} ]]; then
  echo 'Missing argument/s'
  echo 'Usage: bash package_app.sh tickethub 1.5.3'
  exit
fi

PROJECT_ROOT=~/code

if [ $1 == 'tickethub' ]; then
    APP=$1
    DIRECTORY=~/backups/projects/rebrandapps/$APP/TicketHub_$2
    rsync -av --progress --exclude dev_code --exclude rebrander-sdk --exclude .git --exclude .gitignore --exclude .gitattributes --exclude fhd_database.php --exclude .idea $PROJECT_ROOT/$APP/ $DIRECTORY
    cd $DIRECTORY
    cd ../

    # set permissions
    find TicketHub_$2 -type d -exec chmod 755 {} \;
    find TicketHub_$2 -type f -exec chmod 644 {} \;

elif [ $1 == 'seosnapshot' ]; then
    APP=$1
    FOLDER=SEO_Snapshot_$2
    DIRECTORY=~/backups/projects/rebrandapps/$APP/$FOLDER
    rsync -av --progress --exclude dev_code --exclude .env --exclude rebrander-sdk --exclude .git --exclude .gitignore --exclude .gitattributes --exclude .idea --exclude seosnapshot.sublime-project --exclude seosnapshot.sublime-workspace $PROJECT_ROOT/$APP/ $DIRECTORY
    cd $DIRECTORY
    cd ../

    # set permissions
    find $FOLDER -type d -exec chmod 755 {} \;
    find $FOLDER -type f -exec chmod 644 {} \;
    chmod -R 775 $FOLDER/storage

elif [ $1 == 'projecthub' ]; then
    APP=$1
    FOLDER=Project_Hub_$2
    DIRECTORY=~/backups/projects/rebrandapps/$APP/$FOLDER
    rsync -av --progress --exclude dev_code --exclude config/standard/config.php --exclude rebrander-sdk --exclude .git --exclude .gitignore --exclude .gitattributes --exclude .idea $PROJECT_ROOT/$APP/ $DIRECTORY
    cd $DIRECTORY
    cd ../

    # set permissions
    find $FOLDER -type d -exec chmod 755 {} \;
    find $FOLDER -type f -exec chmod 644 {} \;
    chmod -R 775 $FOLDER/config

elif [ $1 == 'pinpoint' ]; then
    APP=$1
    FOLDER=PinPoint_$2
    DIRECTORY=~/backups/projects/rebrandapps/$APP/$FOLDER
    rsync -av --progress --exclude dev_code --exclude .env.php --exclude app/storage/views/* --exclude rebrander-sdk --exclude .git --exclude .gitignore --exclude .gitattributes --exclude .idea $PROJECT_ROOT/$APP/ $DIRECTORY
    cd $DIRECTORY
    cd ../

    # set permissions
    find $FOLDER -type d -exec chmod 755 {} \;
    find $FOLDER -type f -exec chmod 644 {} \;
    chmod -R 775 $FOLDER/app/storage

else
    echo 'Invalid application name!, Valid names are: tickethub, projecthub, pinpoint, or seosnapshot'
    exit
fi

# Zip files



# if [ ! -d $DIRECTORY ]; then
#     echo " -> creating directory $DIRECTORY "
#     mkdir $DIRECTORY
#     cd $PROJECT_ROOT/wp-content/plugins
#     echo " -> creating archive $ARCHIVE "
    #zip -r $ARCHIVE $APP
    # if [ -f $ARCHIVE ]; then
    #     echo " "
    #     echo " -> Done: archive $ARCHIVE has been created!"
    #     echo " "
    # else
    #     echo " "
    #     echo " -> FAILED: archive $ARCHIVE WAS NOT CREATED!"
    #     echo " "
    # fi
    # exit
# else
#     echo "Directory $DIRECTORY already exists!"
#     exit
# fi
exit;

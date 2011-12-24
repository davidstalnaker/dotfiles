#!/bin/zsh
BASE_DIR=$(dirname $0)
INSTALL_DIR=~

cd $BASE_DIR

echo "Installing files from $(pwd) to $INSTALL_DIR. Continue?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) exit;;
    esac
done

if [ $BASE_DIR -ef $INSTALL_DIR ]
then 
	echo "Already installed"
else
	

	rsync -avPr --ignore-existing --remove-source-files $BASE_DIR/ $INSTALL_DIR

	if [ $(ls -A1 | wc -l) -eq 0 ]
	then
		rmdir -- "$(pwd -P)"
		cd ..
	else
		echo 'Warning: not all files moved'
	fi 
fi


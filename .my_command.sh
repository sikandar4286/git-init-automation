#!/bin/bash

function creat(){
    cd
    # source .env file in current directory | make sure you enter the correct path...
    source /mnt/c/Users/Sikandar\ Ali/Documents/projects/git-init-automation/.env
    # create repo using github API
    curl -u $USERNAME:$TOCKEN https://api.github.com/user/repos -d '{"name":"'"$1"'"}'
    cd $FILEPATH #if $FILEPATH not work then manual add the path for example (cd /Users/name/project/etc)
    mkdir $1
    cd $1
    echo "# $1" >> README.md
    git init
    git add README.md
    git commit -m "first commit"
    git remote add origin git@github.com:$USERNAME/$1.git
    git push -u origin master
    explorer.exe .
    code .
}

#!/bin/sh

cd `dirname $0`

for repo in hushfile-web hushfile-server hushfile-py-server
do
  if [ ! -d "${repo}" ]; then
    git clone git@github.com:hushfile/$repo.git
  fi
done

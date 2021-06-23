#!/usr/bin/env bash
apt install apache2-utils
mkdir -p $HOME/registry/auth  && cd $_
#htpasswd -Bc registry.password test
#password is test
cd -

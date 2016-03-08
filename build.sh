#!/bin/bash


function do_init() {

	sudo npm install -g bower
	npm install
	bower install

	mkdir -p static_source/fonts
	cd static_source/fonts
	ln -s ../bower_components/bootstrap/fonts/* .
  ln -s ../bower_components/font-awesome/fonts/* .

  gulp
}

function do_clear() {

	rm -frd node_modules
	rm -frd static_source/bower_components
	rm -frd static_source/css
	rm -frd static_source/js
	rm -frd static_source/tmp
}

case "$1" in
    init)
    do_init
    ;;
    clear)
    do_clear
    ;;
    *)
    echo "Usage: $0 init|clear" >&2
    exit 3
    ;;
esac
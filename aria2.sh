#!/bin/bash

function get_aria2_ports()
{
	sudo lsof -i:6800
}

function kill_aria2_port()
{
    sudo kill -9 $1
}

function start_aria2()
{
	sudo aria2c --conf-path=/etc/aria2/aria2.conf
}

function help_menu()
{
	echo "==============================================="
	echo "          Aria2 command set"
	echo "==============================================="
	echo "-h"
	echo "  show help menu"
	echo "-p"
	echo "  get current TCP ports"
	echo "-k"
	echo "  kill TCP port"
	echo "-s"
	echo "  start to run aria2"
}

if [ $# == 0 ]; then
	help_menu
else
	while getopts 'hpk:s' opt
	do
		case $opt in
		h)
			help_menu
		;;
		p)
			get_aria2_ports
		;;
		k)
			kill_aria2_port $OPTARG
		;;
		s)
			start_aria2
		;;
		esac
	done
fi
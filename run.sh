#!/bin/bash
set -e
nohup java com.randomcopydirec.main.App &
exec $@

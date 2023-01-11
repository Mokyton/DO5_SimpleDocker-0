#!/bin/bash

gcc hello.c -lfcgi -o zohan
spawn-fcgi -p 8080 ./zohan
service nginx start
/bin/bash

#!/bin/bash

VM_IP="192.168.0.1"
USER="adalineb"

scp src_simplebash/tests/cat_tests/s21_cat src_simplebash/tests/grep_tests/s21_grep $USER@$VM_IP:/usr/local/bin

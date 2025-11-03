#!/bin/zsh
# ====================================================
#   Copyright (C) 2025  All rights reserved.
#
#   Author        : Jinjing Li
#   Email         : jinjing-li@foxmail.com
#   File Name     : run_bi212_bi214.sh
#   Last Modified : 2025-11-04 00:47
#   Describe      :
#
# ====================================================

source ~/.zshrc
source setup_bsg_env.sh
bsg_exec -c data/config.txt -e data/ExchangeData.dat --input data/init/Bi212_to_Po212_727keV_detailed.ini -o output/Bi212_f727kev
bsg_exec -c data/config.txt -e data/ExchangeData.dat --input data/init/Bi212_to_Po212_1513keV_detailed.ini -o output/Bi212_f1513kev
bsg_exec -c data/config.txt -e data/ExchangeData.dat --input data/init/Bi212_to_Po212_1621keV_detailed.ini -o output/Bi212_f1621kev
bsg_exec -c data/config.txt -e data/ExchangeData.dat --input data/init/Bi212_to_Po212_1679keV_detailed.ini -o output/Bi212_f1679kev
bsg_exec -c data/config.txt -e data/ExchangeData.dat --input data/init/Bi212_to_Po212_gs_detailed.ini -o output/Bi212_gs
bsg_exec -c data/config.txt -e data/ExchangeData.dat --input data/init/Bi214_to_Po214_609keV_detailed.ini -o output/Bi214_f609kev
bsg_exec -c data/config.txt -e data/ExchangeData.dat --input data/init/Bi214_to_Po214_1015keV_detailed.ini -o output/Bi214_f1015kev
bsg_exec -c data/config.txt -e data/ExchangeData.dat --input data/init/Bi214_to_Po214_1275keV_detailed.ini -o output/Bi214_f1275kev
bsg_exec -c data/config.txt -e data/ExchangeData.dat --input data/init/Bi214_to_Po214_1377keV_detailed.ini -o output/Bi214_1377kev
bsg_exec -c data/config.txt -e data/ExchangeData.dat --input data/init/Bi214_to_Po214_gs_detailed.ini -o output/Bi214_gs

#!/usr/bin/env python3
# -*- coding:utf8 -*-
# coding style: pep8
# ====================================================
#   Copyright (C) 2025  All rights reserved.
#
#   Author        : Jinjing Li
#   Email         : jinjing-li@foxmail.com
#   File Name     : plot_spec.py
#   Last Modified : 2025-11-04 01:04
#   Describe      :
#
# ====================================================

import sys
import pandas as pd
import matplotlib.pyplot as plt

# Check if the correct number of arguments is provided
if len(sys.argv) != 4:
    print("Usage: python script.py <filename.txt> <i> <j>")
    sys.exit(1)

# Parse arguments
filename = sys.argv[1]
i = int(sys.argv[2]) - 1  # Convert to 0-based index
j = int(sys.argv[3]) - 1  # Convert to 0-based index

# Read the TXT file assuming space-separated columns and no header
data = pd.read_csv(filename, delim_whitespace=True, header=None)

# Validate column indices (assuming 4 columns)
if i < 0 or i >= 4 or j < 0 or j >= 4:
    print("Error: i and j must be between 1 and 4.")
    sys.exit(1)

# Extract x and y columns
x = data[i]
y = data[j]

# Plot the data
plt.plot(x, y)
plt.xlabel(f"Column {i+1}")
plt.ylabel(f"Column {j+1}")
plt.title(f"Plot of Column {i+1} vs Column {j+1}")
plt.show()

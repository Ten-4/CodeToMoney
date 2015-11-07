#!/bin/bash

cd /judge

timeout 1 nosetests-2.7 test_solution.py

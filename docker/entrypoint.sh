#!/bin/bash

cd /judge

timeout 5 nosetests-2.7 test_solution.py

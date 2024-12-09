#!/bin/bash
for i in {1..100}; do
    while ($true) {
        ab -n 1000 -c 10 http://172.17.0.2/
    }
    sleep 1
done
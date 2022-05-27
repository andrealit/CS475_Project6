#!/bin/bash
for  lws in 8 32 64 128 256 512
do
        for gws in 1 512 1024 2048 4096 8192
        do
                g++ -DNMB=$gws -DLOCAL_SIZE=$lws -o first first.cpp /usr/local/apps/cuda/10.1/lib64/libOpenCL.so.1.1 -lm -fopenmp
                ./first 2>> results.csv

                g++ -DNMB=$gws -DLOCAL_SIZE=$lws -o second second.cpp /usr/local/apps/cuda/10.1/lib64/libOpenCL.so.1.1 -lm -fopenmp
                ./second 2>> results.csv
        done
done

for lws in 32 64 128 256
do
        for gws in 1 512 1024 2048 4096 8192
        do
                g++ -DNMB=$gws -DLOCAL_SIZE=$lws -o third third.cpp /usr/local/apps/cuda/10.1/lib64/libOpenCL.so.1.1 -lm -fopenmp
                ./third 2>> third_results.csv

        done
done
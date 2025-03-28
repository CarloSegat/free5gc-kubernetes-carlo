#!/bin/bash

# Run helm lint on charts inside ./charts/free5gc/charts/
helm lint ./charts/free5gc/charts/*
helm lint ./charts/ssim/

# Run helm lint on charts inside ./charts/
helm lint ./charts/*

# Package charts and place them in ./repo/
helm package --destination ./repo/ ./charts/*

# Generate Helm repository index
helm repo index --url https://github.com/CarloSegat/free5gc-kubernetes-carlo .
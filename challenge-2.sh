#!/bin/bash

metadata=$(curl -s -H Metadata:true "API URL")
echo $metadata | jq .

chmod +x challenge-2.sh
./query_instance_metadata.sh

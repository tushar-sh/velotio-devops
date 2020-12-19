#!/bin/bash
set -euo pipefail:q


echo -e "Iterating...\n"
#To get a list of all the nodes in cluster
nodes=$(kubectl get node --no-headers -o custom-columns=NAME:.metadata.name)

#Iterating over each node recorded in 'nodes' variable on describe cmd

for node in $nodes; do
  echo "Node: $node"
  kubectl describe node "$node" | sed '1,/Non-terminated Pods/d'
  kubectl describe node "$node" | sed '1,/Non-terminated Pods/d' > /root/Documents/Logs/resource.txt 
  #We can even concatenate date cmd's output in name of file, while saving file before uploading to s3 bucket
  echo
done

##Pushing the data to S3 Bucket
##Assumptions, the user setup has min permisssions to do the neccessary tasks in his S3 bucket, and aws cli is installed on the the host ystem.

#Commenting out below LOC so that tha flow dosen't break.

#$(aws s3 cp /root/Documents/Logs/resource.txt s3://mybucket/nodeMonitor/logs/)


##For Adding crontab entry (Not a Part of this shell script)

#($crontab -e)
# */10 * * * * 
#This cronjob would run every 10 minutes

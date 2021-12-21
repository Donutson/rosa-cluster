# download rosa
wget https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/rosa/latest/rosa-linux.tar.gz
tar -xvf rosa-linux.tar.gz
sudo mv rosa /usr/local/bin/rosa
# install aws cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip";
unzip awscliv2.zip
sudo ./aws/install
# set aws credential
aws configure set aws_access_key_id ${access_key}
aws configure set aws_secret_access_key ${secret_key}
aws configure set default.region us-east-1
aws configure set default.output json
# download oc cli
rosa download oc
sudo tar -xvf openshift-client-linux.tar.gz
sudo mv oc /usr/local/bin/oc
# authenticate to redhat and create openshift cluster
rosa init --token=${redhatToken}
rosa create cluster --cluster-name ${clusterName} --region ${region} --version ${version} --compute-nodes ${computeNode} --compute-machine-type ${computeMachineType} --machine-cidr ${machineCIDR} --service-cidr ${serviceCIDR} --pod-cidr ${podCIDR} --host-prefix ${hostPrefix} --disable-workload-monitoring
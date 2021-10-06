COS_NAME=$1    # Name of the COS instance where objects will be uploaded
BUCKET_NAME=$2 # Name of the bucket to upload to
KEY=$3         # Name of the object as it will appear in the bucket
BODY=$4        # Path to the file that will be uploaded
# Get CRN from the resource API
COS_CRN=$(ibmcloud resource service-instance $COS_NAME --output json | jq -r ".[0].id")
# Setup config to allow upload to COS from command line
ibmcloud cos config crn --crn $COS_CRN --force
# Upload object
ibmcloud cos object-put --bucket $BUCKET_NAME --key $KEY --body $BODY
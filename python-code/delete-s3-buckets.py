#!/usr/bin/env python3

# credits to the script owner

## do the exports below, or aws --configure
# export AWS_ACCESS_KEY_ID=""
# export AWS_SECRET_ACCESS_KEY=""
# export AWS_SESSION_TOKEN=""

BUCKETS = [ 
    "some-uniquely-named-s3-bucket-8empv7ppqure"
]

import boto3

for BUCKET in BUCKETS:
    print(f"Working on s3-bucket: {BUCKET}")
    s3 = boto3.resource('s3')
    bucket = s3.Bucket(BUCKET)
    bucket.object_versions.delete()

    # if you want to delete the now-empty bucket as well, uncomment this line:
    #bucket.delete()

#!/bin/bash

set -x
awslocal s3 mb s3://local-myapp-test

awslocal s3 cp /docker-entrypoint-initaws.d/csv/test/test.csv s3://local-myapp-test/

set +x
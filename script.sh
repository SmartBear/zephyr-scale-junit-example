#!/bin/bash

PROJECT_KEY="DEV" # provide your project key

URL="https://api.adaptavist.io/tm4j/v2/automations/executions/junit?projectKey=${PROJECT_KEY}&autoCreateTestCases=false"

TOKEN="" # provide your Public REST API token

mvn test

zip -D ./target/junit_tests.zip ./target/surefire-reports/TEST*.xml

curl -o -X POST -F "file=@target/junit_tests.zip" -H "Authorization: Bearer ${TOKEN}" $URL



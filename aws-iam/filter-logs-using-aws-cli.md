Search for logs or events in Cloudwatch

```
aws logs filter-log-events \
  --log-group-name /aws/lambda/your-lambda-function-here \
  --filter-pattern "some-string-you-are-searching-for" \
  --start-time $(($(date -d "-2 days" +%s%3N)))
```


NOTE:
Replace the parameters with your own.


-----

```
export LOG_GROUP_NAME="/aws/lambda/your-lambda-function-name"
export FILTER_PATTERN="some-string-to-search-for"
export START_TIME=$(date -d "-2 days" +%s%3N)

aws logs filter-log-events \
  --log-group-name ${LOG_GROUP_NAME}
  --filter-pattern ${FILTER_PATTERN}
  --start-time ${START_TIME}
```

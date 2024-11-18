Search for logs or events in Cloudwatch

```
aws logs filter-log-events \
  --log-group-name /aws/lambda/your-lambda-function-here \
  --filter-pattern "some-string-you-are-searching-for" \
  --start-time $(($(date -d "-2 days" +%s%3N)))
```


NOTE:
Replace the parameters with your own.

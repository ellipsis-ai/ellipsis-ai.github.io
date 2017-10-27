# Async Api

## Problem
You want to create a Skill that uses an asynchronous API. You want the async API
to invoke an Action or notify a user or a channel when a specific event occurs.

## Solution
There are several ways to solve this use case depending on the details of the async
API and what control you have on it.

### Case 1: you have full control on the async API and system.
In this case you simply generate an auth token in your Action code and pass it
to the async API with the request. You then change the code of the async API to call
the Ellipsis REST APIs with the auth token.

Let's look at an example.

Report Generator is a system that builds complex Excel reports and store them
in AWS S3. Some of the reports take minutes to generate therefore Report
Generator has an async API. Our goal is to implement an Ellipsis Action, let's
call it _get_report_, that uses the Report Generator API to request a new
report on behalf of the user and that notifies the user when the report is ready.

Ellipsis _get_report_ implementation looks like this:

```
// request report Action

const EllipsisApi = ellipsis.require('ellipsis-api');
const api = new EllipsisApi(ellipsis).actions;

// Async API
const reportBuilder = require('my-report-builder');

// The token expires after 2 minutes.
api.generateToken({ isOneTime: false, expirySeconds: 120 }).then(token => {
    reportBuilder({
      reportTye: "ARM",
      startDate: "2017-01-01",
      endDate: "2017-02-01",
      ellipsisData: {
        user: @mark,
        authToken: token.id
      }
    });

    //...
});

```
Assuming the Request Report system is implemented in Node.js, somewhere in the
code after the report has been generated and upload to AWS S3 you call the Ellipsis
REST API to let the user know the requested report is ready:

```
const request = require('request');
const ellipsisData = getEllipsisData();

const content = {
    message: "Your report is ready: https://reports-123.s3.aws.amazon.com/report-123asdasf3425.xls",
    responseContext: "slack",
    channel: ellipsisData.user,
    token: ellipsisData.token
  };
request(
  {
    url: "https://bot.ellipsis.ai/api/v1/say",
    method: "POST",
    json: true,
    body: content
  },
  function (error, response, body) { console.log(response); }
);
```

### Case 2: the async API supports webhooks for event notifications.
This is the case where the async api takes a URL to post to when a certain event
occurs, you do not have control over the source code of the async API. A classic
example is the [Github Webhooks API ](https://developer.github.com/webhooks/)

...to be finished
## Discussion

## See Also
* [Ellipis API](/developers/reference/api/v1/overview)

# Async API

## Problem
You want to create a skill that uses an asynchronous API. You want the async API
to invoke an [action](../reference/actions/index.md), or notify a user or channel
when a specific event occurs.

## Solution
There are several ways to solve this use case depending on the details of the async
API and what control you have over it.

### Case 1: you have full control over the async API and system.
In this case, you generate an auth token in your action code and pass it
to the async API with the request. You then change the code of the async API to call
the Ellipsis API using the auth token.

**Here's an example:**

Report Generator is a system that builds complex Excel reports and stores them
in Amazon Web Services (AWS) S3. Some reports take a few minutes to generate, so
Report Generator has an async API. The goal is to implement an Ellipsis action
called `get_report` that uses the Report Generator API to request a new
report on behalf of the user, and then notify the user when the report is ready.

In Ellipsis, the `get_report` implementation looks like this:

```
// request report action

const EllipsisApi = ellipsis.require('ellipsis-api');
const api = new EllipsisApi(ellipsis);

// Async API
const reportBuilder = require('my-report-builder');

// The token expires after 2 minutes.
api.generateToken({ isOneTime: false, expirySeconds: 120 })
  .then(token => {
    reportBuilder({
      reportType: "ARM",
      startDate: "2017-01-01",
      endDate: "2017-02-01",
      ellipsisData: {
        user: "@mark",
        authToken: token.id
      }
    });
    //...
});
```

Assuming the Request Report system is implemented in Node.js, somewhere in the
code, after the report has been generated and uploaded to S3, you can use the Ellipsis
API to notify the user that the requested report is ready:

```
const request = require('request');
const ellipsisData = getEllipsisData();

const content = {
  message: "Your report is ready: https://reports-123.s3.aws.amazon.com/report-123asdasf3425.xls",
  responseContext: "slack",
  channel: ellipsisData.user,
  token: ellipsisData.token
};
request({
  url: "https://bot.ellipsis.ai/api/v1/commands/say",
  method: "POST",
  json: true,
  body: content
}, (error, response, body) => {
  console.log(response);
});
```

## See also
* [Ellipsis API](../reference/api/v1/overview.md)

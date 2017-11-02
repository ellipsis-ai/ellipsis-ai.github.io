---
title: API reference
number: 6
---

## Authentication
## Errors
## Versioning

For instance, let's say you have created an Action called "echo" that takes
and argument called _text_ and just prints it out. You can
run this action by doing an HTTP POST to https://bot.ellipisis.ai/06_api/v1/action_requests
with the following body:

```
curl https://bot.ellipsis.ai/06_api/v1/action_requests \
   -X POST \
   -d "message=...echo Ciao!" \
   -d "responseContext=slack" \
   -d "channel=#dev" \
   -d "token=your_auth_token"
```

Or if you want want Ellipsis to send a message to user @mark:

```
curl https://bot.ellipsis.ai/06_api/v1/messages \
   -X POST \
   -d "message=Hello" \
   -d "responseContext=slack" \
   -d "channel=@mark" \
   -d "token=your_auth_token"
```

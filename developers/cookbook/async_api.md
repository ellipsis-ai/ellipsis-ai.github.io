# Async Api

## Problem
You want to create a Skill that uses an asynchronous API. You want the async API
to invoke an Action or notify to a user or a channel when an specific event occurs.

## Solution
You can use the Ellipsis REST APIs as webhooks and pass them directly to the asynch
APIs.

First you need to create an [authentication token](https://bot.ellipsis.ai/settings/https://bot.ellipsis.ai/list_api_tokens).
With the token you can now call the Ellipsis REST APIs.

For instance, let's say you have created an Action called "echo" that takes
and argument called _text_ and just prints it out. You can
run this action by doing an HTTP POST to https://bot.ellipisis.ai/api/v1/action_requests
with the following body:

```
curl https://bot.ellipsis.ai/api/v1/action_requests \
   -X POST \
   -d "message=...echo Ciao!" \
   -d "responseContext=slack" \
   -d "channel=#dev" \
   -d "token=your_auth_token"
```

Or if you want want Ellipsis to send a message to user @mark:

```
curl https://bot.ellipsis.ai/api/v1/messages \
   -X POST \
   -d "message=Hello" \
   -d "responseContext=slack" \
   -d "channel=@mark" \
   -d "token=your_auth_token"
```

## Discussion

## See Also

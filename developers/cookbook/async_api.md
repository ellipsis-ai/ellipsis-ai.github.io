# Async Api

## Problem
You want to use an async service that takes a webhook and invoke your Action when
some events occur.

## Solution
Each Ellipsis Action can be run using the REST API runAction. Therefore all you
have to do is create an authentication token and pass the runAction url to the
async API.

For instance, let's say you have created an Action called "repeat" that takes
and argument called input_string and just prints it out. You can
run this action by [creating an auth token] (https://bot.ellipsis.ai/settings/https://bot.ellipsis.ai/list_api_tokens)
and doing an HTTP POST to https://bot.ellipisis.ai/api/run_action with the
following payload:

```
   {
     "actionName": "repeat",
     "arguments": [{"name": "input_string" ,"value": "ciao" }],
     "responseContext": "",
     "channel": "#developers",
     "token": "your_auth_token"
   }
```


## Discussion

## See Also

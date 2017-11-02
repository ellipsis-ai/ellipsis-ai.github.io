---
title: Node.js function
number: c
---

**Each action can run a single JavaScript function that performs a task or calculates something.**

The function should end by telling Ellipsis that it completed successfully (including any text or data you want to include in the [response]({% link _developer_reference/02_actions/04_template.md %})), or else it can signal that an error occurred, or that there should be no response.

Adding a function is optional. If you want your action to return the same response every time, you don't need to write any code.

Functions run in the Node.js environment (v6.10.2). That means you can use [any documented feature of Node.js](https://nodejs.org/dist/latest-v6.x/docs/06_api/), and you can also load other modules using the `require` feature -- either skill libraries, or any [NPM package](https://www.npmjs.com/).

## Function parameters

The function itself is always declared for you. It will automatically receive an `ellipsis` object as a parameter. If you've defined any [inputs]({% link _developer_reference/02_actions/02_inputs.md %}), each of those will also be received as parameters. In other words, you only need to write the "inside" of the function.

```javascript
module.exports = function(ellipsis) {
// write your code here; it will execute when the action runs
};
```

## The `ellipsis` object and callback methods

The `ellipsis` object includes callback methods you use to tell Ellipsis when your function has finished. **You must call one of the methods to finish.** (Using a simple `return` statement will not work.)

There are three callback methods:

- `ellipsis.success`
- `ellipsis.error`
- `ellipsis.noResponse`

Call `ellipsis.success()` when your function is finished and you want to send a response to the user that ran the action. Pass any text or data you want to include in the response.

Call `ellipsis.error()` when something has gone wrong and you want to send an error message.

Call `ellipsis.noResponse()` when you want to finish but send no response. This is typically useful for scheduled actions that you only want to respond in certain circumstances (e.g. an alert).

You will see an error message if your function runs without calling one of these methods.

`ellipsis` contains other useful run-time properties, like information about the team and the user. [See the `ellipsis` object reference.]

## Examples

#### Example: Hello world

You can send a string you want to include in the response. Insert it into the [response template]({% link _developer_reference/02_actions/04_template.md %}) using the `{successResult}` placeholder.

```javascript
module.exports = function(ellipsis) {
  const result = 1 + 1;
  ellipsis.success("Hello world! 1 + 1 = " + result);
  // Passes "Hello world! 1 + 1 = 2" to the response template
};
```

#### Example: the current date and time

```javascript
module.exports = function(ellipsis) {
  const now = new Date();
  ellipsis.success(now.toString());
  // Passes the current date and time (in UTC) as a string to the response template
};
```

#### Example: using inputs to construct a response

In this example, two [inputs]({% link _developer_reference/02_actions/02_inputs.md %}) have been configured -- `firstName` and
`lastName`, and it uses [JavaScript's template literal syntax](https://developer.mozilla.org/docs/Web/JavaScript/Reference/template_strings) to format the text more easily.

```javascript
module.exports = function(firstName, lastName, ellipsis) {
  const response = `Hello, ${firstName} ${lastName}.

How do you do?`;
  ellipsis.success(response);
  // Use JavaScript's template literal syntax to combine text with variables
};
```

#### Example: sending data to the response template

You can send data using a JSON-style object to the template instead of a string, and then insert each properties individually.

```javascript
module.exports = function(ellipsis) {
  const now = new Date();
  const data = {
    hour: now.getHours(),
    minute: now.getMinutes()
  };
  ellipsis.success(data);

  // The response template will receive an object with `hour` and `minute` properties.
  // Use {successResult.hour} and {successResult.minute} to insert the text in the template.
};
```

#### Example: Sending an error message

When something goes wrong, signal that an error occurred and include an explanatory message.

```javascript
module.exports = function(ellipsis) {
  const now = new Date();
  const day = now.getDay();
  if (day === 0 || day === 6) {
    ellipsis.error("Sorry, this action can only be run on weekdays.");
    // Skips the response template, and sends an error message to the user.
  } else {
    ellipsis.success("Another day, another dollar.");
  }
};
```

#### Example: sending no response

If you want Ellipsis to remain silent in certain circumstances, you can signal that no response should occur.

```javascript
module.exports = function(ellipsis) {
  const now = new Date();
  const day = now.getDay();
  if (day === 1) {
    ellipsis.success("Looks like someone’s got a case of the Mondays!");
  } else {
    ellipsis.noResponse();
  }
};
```

#### Example: using NPM packages

You can `require` any NPM package by name. Ellipsis will install the latest version of the package for you automatically.

```javascript
module.exports = function(ellipsis) {
  const moment = require('moment-timezone'); // A useful package for dealing with dates/times

  const now = moment().tz('America/Los_Angeles');
  ellipsis.success(now.format("h:mm A z"));
  // Passes the current time as a string for the Pacific time zone
};
```

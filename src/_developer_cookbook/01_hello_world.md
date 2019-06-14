---
title: Hello World
number: 1
---

## Create an action that says hello

A simple Ellipsis action can give a personal hello to the person that triggers it.

### Create a new skill

Give the skill a name, e.g. `Greetings`, and choose an emoji, like 👋.

### Edit the first action

A single action is created by default for a new skill. Click the action on the left sidebar to edit it.

### Name the action

Change the name of the action to **`sayHello`**.

### Triggers

Add a trigger with the text **`hello`**, and another with the text **`hi`**. Keep both set for messages **"To Ellipsis"**, so the bot will only respond when mentioned by name. The bot will respond to any message that includes the bot's name and begins with "hello" or "hi". (Uppercase and lowercase are ignored.)

### Inputs

No inputs are necessary since we don't need to collect additional information from the user.

### Code

The function is written in Node.js. It will obtain someone's name, or if it's unavailable for some reason, fallback to "friend", and then call `ellipsis.success` with a message to deliver the result back to the user.

```javascript
module.exports = function(ellipsis) {
  const name = ellipsis.user.fullName || "friend";
  const message = `Hello, ${name}`;
  ellipsis.success(message);
};
```

Note that the function definition is provided for you — you only need to edit what's inside the function. The template literal string syntax illustrated here (using backticks) is helpful for inserting dynamic text into a string.

### Response

Keep the default response template, which simply inserts the text passed to the `ellipsis.success` function.

```markdown
{successResult}
```

### Result

If someone named Jane Doe says, e.g. "@Ellipsis hello" or "hi @Ellipsis!", the bot will respond with "Hello, Jane Doe".

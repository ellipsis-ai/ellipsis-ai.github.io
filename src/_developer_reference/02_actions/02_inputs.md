---
title: Inputs
---

Adding inputs to an [action]({% link _developer_reference/02_actions.md %}) allows you to collect answers from the user that can then be used in your [function]({% link _developer_reference/02_actions/03_function.md %}). Answers are collected after a user triggers the action, before the function runs.

Actions don't require inputs, but if you need to collect some text or a value when the action runs that may change each time, or is different for each user, then you should use an input.

## Defining inputs

For each input, you need to set:

- a **name** to be used in your function
- a **question** to ask the user
- whether to **save the answer** or ask every time
- the **type** of input or answer you expect

## Input name

The name of each input:

- must be a single word (no spaces)
- must start with a letter of the alphabet (lowercase or uppercase A–Z), or a single underscore (`_`)
- may contain only letters, numbers, or underscores
- can not be any [reserved word or literal value in JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Lexical_grammar#Keywords) (e.g. `if`, `function`, `true`, `null`, etc.)

Your function will receive a parameter with the name you choose, with the value set to the answer the user provided. For example, if you make an input called `name`, your function will receive a parameter called `name`.

## Input question

The question is what Ellipsis should ask the user when collecting the answer. For example, "What is your first name?"

## Saving and re-using answers

By default, inputs are set to "ask each time action is triggered". Whenever the action runs, a new answer is collected from the user.

You can also choose to save the answer and re-use it next time, meaning the question will be asked only once.

- **Ask once for the team, then re-use the answer** will ask the question one time, and then re-use that answer no matter who runs the action
- **Ask once for each user, then re-use the answer** will ask the question once for each person, and then re-use that answer if the same person runs the action

Once answers are saved, they can be inspected and/or removed by clicking **Details** in the input configuration.

Saved answers can be overridden by answers [collected from the trigger](#collecting-input-answers-from-triggers).

## Data type

You can decide what type of answer the user must provide. If set to something other than _Text_, Ellipsis will ensure the answer is the right type. (Ellipsis won't complete the action until the user provides a valid answer.)

### Basic data types

There are three basic types:

- **Text** -- the default, allowing any kind of text as a response
- **Number** -- the answer must be numeric (or easily understood as a number)
- **Yes/No** -- the answer must be either "yes" or "no" (or some easily-understood synonym)

If you set an input to be a number, your function will receive a [JavaScript Number value](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number), i.e. an integer or floating-point number.

If you set an input to be Yes/No, your function will receive a [JavaScript Boolean value](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean), either `true` (if "yes") or `false` (if "no").

### Custom data types

In addition to the basic types, you can set inputs to custom data types that rely on code or a table of data to determine what a valid answer is. The user will be asked to choose an answer from a list of possible answers, and the function will receive a JavaScript object with the chosen item's properties.

Custom data types are useful when you want the user's answer to be limited to specific choices. Some examples:

- searching for a geographical location using an API
- selecting from a list of people
- deciding between dynamically-generated dates like "today" or "tomorrow"

## Collecting input answers from triggers

The answers for each input can be collected from the [trigger text]({% link _developer_reference/02_actions/01_triggers.md %}) that triggered the action in the first place, if the trigger includes ["fill-in-the-blank" inputs]({% link _developer_reference/02_actions/01_triggers.md %}#fill-in-the-blank-input), or [regular expression capturing parentheses]({% link _developer_reference/02_actions/01_triggers.md %}#collecting-inputs-with-regular-expression-patterns).

When an answer is found in the trigger, the question will be skipped. In addition, answers from triggers will override any saved answer.

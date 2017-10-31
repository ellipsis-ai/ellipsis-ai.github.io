---
title: Testing actions
---

The skill editor has a built-in testing tool that can help you test the components of an action:

- You can test what text will [trigger]({% link _developer_reference/actions/triggers.md %}) the action, and what (if any) input is collected from the trigger
- You can test running the action, which will run the [function]({% link _developer_reference/actions/function.md %}) (if any) using [input values]({% link _developer_reference/actions/inputs.md %}) of your choice, and see what the [response]({% link _developer_reference/actions/template.md %}) is.

Click the **Test…** button while any action is selected in the skill editor to begin testing.

## Test the triggers

Type a message to see which trigger it matches, if any. If your trigger collects input using the [fill-in-the-blank method]({% link _developer_reference/actions/triggers.md %}#fill-in-the-blank-input) or [capturing parentheses]({% link _developer_reference/actions/triggers.md %}#collecting-inputs-with-regular-expression-patterns), the tool will fill in what input was collected.

## Test the response

Click **Test response** to run the action. You can edit what input the action uses. Once the action is complete, the test tool will show you the response or any error that may have occurred.

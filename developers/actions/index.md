# Actions

Actions are how people on your team interact with Ellipsis. Each action can perform a task and/or respond to someone with an answer.

Actions can run code to perform dynamic tasks, or they can just return a static response.

## Name and description

Each action can have a name and description which can be used to help explain what it's for. Action names can also be used to trigger actions through the [../ellipsis_api/index.md](Ellipsis API). The name and description are optional.

## Components of the action

There are four components that define how an action works:

1. [Triggers](./triggers.md)

    Triggers define what text Ellipsis will listen for in chat. When someone types a matching trigger, Ellipsis will run the action. Actions can also be triggered by [scheduling](../../users/scheduling/index.md), or by code in other actions.

2. [Inputs](./inputs.md)

    Inputs define what questions (if any) Ellipsis will ask the user before performing a task or returning a response.

3. [Node.js function](./function.md)

    The Node.js function is the code you want Ellipsis to run each time this action is triggered. The function receives the answers to any questions specified by the inputs.

4. [Response template](./template.md)

    The response template defines what Ellipsis will say when the action is complete. Data or text from the function can be included in the response.

## [Testing actions](./testing.md)

Actions can be [tested](./testing.md) from the skill editor to see whether text matches a trigger, and to see what response Ellipsis provides after running the code.

## [Cloning and deleting actions](./cloning_deleting.md)

While editing an action, you can clone it to make a copy in the same skill, or delete it to remove it from the skill.

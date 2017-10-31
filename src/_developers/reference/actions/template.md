---
title: The response template
---

The template tells Ellipsis what to say to the user when the action is complete. It can include:

- plain text
- Markdown-style formatting
- text or data calculated by the [function]({% link _developers/reference/actions/function.md %})
- if/else logic and looping over lists (arrays)

## Markdown-style formatting

Because most responses are delivered in chat, the formatting choices are somewhat limited, but you can do:

````markdown
You can use **bold text** and _italic text_.

Use two new lines to separate paragraphs. You can also [include links](https://ellipsis.ai).

You can also make:

- Bulleted lists
- Using hyphens

And:

1. Numbered lists
2. Are useful too

You can also include quoted text:

> Remember the time you included quoted text?
> That was great.

Finally, if you want to mark sections as code, using a monospace font, you can use
`backticks`, or do a whole block of code block with 3 backticks:

```
function() {
  // This is a block of code
}
```
````

The above template would render like this:

You can use **bold text** and _italic text_.

Use two new lines to separate paragraphs. You can also [include links](https://ellipsis.ai).

You can also make:

- Bulleted lists
- Using hyphens

And:

1. Numbered lists
2. Are useful too

You can also include quoted text:

> Remember the time you included quoted text?
> That was great.

Finally, if you want to mark sections as code, using a monospace font, you can use
`backticks`, or do a whole block of code block with 3 backticks:

```
function() {
  // This is a block of code
}
```

## Including text from the function

Use the special `{successResult}` placeholder to insert whatever your function passed when calling `ellipsis.success`.

For example, if the function called `ellipsis.success(1 + 1);`, using `{successResult}` in the template would insert `2` into the response.

#### Template:

```markdown
One plus one is {successResult}.
```

#### Response shown:

One plus one is 2.

## Including data from the function

If your function passes a data object instead of a string, you can insert the properties by name.

#### Function:

```javascript
ellipsis.success({
  firstName: "Luke",
  lastName: "Andrews"
});
```

#### Template:

```markdown
Hello, {successResult.firstName} {successResult.lastName}! Nice to meet you.
```

#### Response:

Hello, Luke Andrews! Nice to meet you.

## Simple logic with `{if...}` and `{else}`

You can do simple if/else logic in your template to show different text depending on a boolean value. Only strict boolean values can be used (`true` or `false`). Use `{if [boolean value]}`, `{else}` and `{endif}`.

#### Function:

```javascript
const day = new Date().getDay();
ellipsis.success({
  isMonday: day === 1
});
```

#### Template:

```markdown
{if successResult.isMonday}
Looks like someone has a case of the Mondays!
{else}
Good morning!
{endif}
```

#### Response:

Ellipsis will say "Looks like someone has a case of the Mondays!" or "Good morning!" depending on whether today is Monday.

## Looping over a list or array with `{for...in}`

If your function passes an array of items, you can loop over them to repeat the same formatting for each one using `{for [item] in [list]}` and `{endfor}`.

#### Function:

```javascript
ellipsis.success({
  people: [{
    name: "Bill Lumbergh",
    title: "Manager"
  }, {
    name: "Peter Gibbons",
    title: "Drone"
  }]
});
```

#### Template:

```markdown
{for person in successResult.people}
- Name: {person.name}
- Title: {person.title}

{endfor}
```

#### Response:

- Name: Bill Lumbergh
- Title: Manager

- Name: Peter Gibbons
- Title: Drone

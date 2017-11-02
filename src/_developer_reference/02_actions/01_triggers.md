---
title: Triggers
number: a
---

Triggers tell Ellipsis what text to listen for in order to run an action. When someone types a phrase in chat that matches a trigger, Ellipsis will run the action and return a response (if any) in the same channel (or group or direct message).

_Note: Ellipsis must be present in the channel to see and respond to a trigger._

## Trigger types

There are two types of triggers:
- phrase triggers
- regular expression triggers

## _To Ellipsis_ versus _Any message_

By default, when _To Ellipsis_ is selected, a person must mention Ellipsis in a message to activate the trigger if it's in a group channel. (If the message is private from the user to Ellipsis, this does not apply.)

If _Any message_ is selected, Ellipsis will respond regardless of whether it is mentioned in the message.

_Note: a shortcut to mention Ellipsis is to start a message with three periods or the ellipsis character ("..." or "…")._

### Phrase triggers

By default, triggers match whenever someone begins a message with the phrase specified by the trigger, while also mentioning Ellipsis. Upper/lowercase differences are always ignored.

#### Example

_Trigger phrase:_
- `what's on my calendar`

_Matching messages:_
- `@ellipsis what's on my calendar`
- `...what's on my calendar`
- `What's on my calendar, @ellipsis?`
- `WHAT'S ON MY CALENDAR YOU BLASTED ROBOT, @ELLIPSIS!`

_Non-matching messages:_
- `what's on my calendar` -- Ellipsis isn't mentioned
- `that's what's on my calendar @ellipsis` -- message contains the trigger text, but doesn't start with it

### Fill-in-the-blank input

Phrase triggers can include "fill-in-the-blank" portions that match any text by using curly braces with a name, e.g. `{keyword}`. If you define [inputs]({% link _developer_reference/02_actions/02_inputs.md %}) with the same names, the text will be assigned for that input, instead of asking the user a question. The fill-in-the-blank name must be a single word, starting with a letter, and containing only letters, numbers and/or underscores.

#### Example 1

_Trigger phrase:_
- `fetch the report for {date}`

_Matching messages:_
- `@ellipsis Fetch the report for yesterday` -- uses "yesterday" for the `date` input
- `...fetch the report for May 2017` -- uses "May 2017" for the `date` input
- `...fetch the report for apples` -- uses "apples" for the `date` input

_Non-matching message:_
- `@ellipsis fetch yesterday's report`

#### Example 2

_Trigger phrase:_
- `notify {person} in {group}`

_Matching messages:_
- `@ellipsis Notify Luke Andrews in accounting` -- uses "Luke Andrews" for `person` and "accounting" for `group`
- `...notify bob in #general` -- uses "bob" for `person` and "#general#" for `group`
- `@ellipsis notify Andrew Catton in the circus ring` -- uses "Andrew Catton" for `person` and "the circus ring" for `group`

### Regular expression triggers

Regular expression (aka regex) triggers use [Java-8-compatible pattern matching](https://docs.oracle.com/javase/8/docs/06_api/java/util/regex/Pattern.html). This permits a lot more flexibility in terms of deciding what text should match, at the expense of readability. (It's usually a good idea to define at least one phrase trigger in addition to any regular expression triggers.)

#### Example

_Trigger pattern:_
- `fetch the report$`

_Matching message:_
- `@ellipsis fetch the report`

_Non-matching message:_
- `@ellipsis fetch the report for today` -- the `$` terminator prevents matching partial text

#### Case sensitivity

Case sensitivity is turned off by default. To turn it on, add the prefix `(?-i)` to your regular expression.

- `ABC` -- will match "ABC", "abc", "Abc", etc.
- `(?-i)ABC` -- will only match "ABC", not "abc" or "Abc"

### Collecting inputs with regular expression patterns

Use capturing parentheses to collect inputs. The captured text will be assigned to the inputs in the same order that the inputs are defined. If you _don't_ want to collect input but you need parentheses, use the non-capturing flag. For example, `(foo|bar)` will match "foo" or "bar", and will collect it as an input. `(?:foo|bar)` will match "foo" or "bar", but it won't be collected as input.

#### Example 1

_Trigger pattern:_
- `fetch the report for (\d{4}-\d{2})$`

_Matching message:_
- `...fetch the report for 2017-05` -- "2017-05" will be used for the first input

_Non-matching message:_
- `...fetch the report for last month` -- "last month" doesn't match the pattern

#### Example 2

_Trigger pattern:_
- `remind me at ((?:1[0-2]|[1-9]):[0-5][0-9])\s*([ap]\.?m\.?)`

_Matching messages:_
- `@ellipsis remind me at 12:59 pm` -- "12:59" and "pm" will be collected as the first and second inputs respectively
- `...remind me at 1:05 A.M.` -- "1:05" and "A.M." will be collected as the first and second inputs respectively

_Non-matching messages:_
- `...remind me at 19:00 UTC`


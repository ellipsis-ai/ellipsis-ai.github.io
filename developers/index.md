# Developer's guide to Ellipsis.ai

## Reference

The reference explains the core concepts and features of Ellipsis, a tool to perform tasks, work with data, and answer questions in chat.

Ellipsis learns how to respond using “skills”, which can be installed or created from scratch. A skill is a collection of one or more “actions” that perform a task and/or return a response. Typically, all of the actions in a skill are related in some way, by theme or by the kind of data they use.

1. [Skills](reference/skills/index.md)
    1. [Version history](reference/skills/index.md#version-history)
    2. [Title, description, and icon](reference/skills/index.md#skill-details-the-title-description-and-icon)
    3. [Installing, cloning, merging, deleting](reference/skills/management.md)
    4. [Exporting and importing](reference/skills/index.md#exporting-skills)
2. [Actions](reference/actions/index.md)
    1. [Triggers](reference/actions/triggers.md)
    2. [Inputs](reference/actions/inputs.md)
    3. [Node.js function](reference/actions/function.md)
    4. [Response template](reference/actions/template.md)
    5. [Testing](reference/actions/testing.md)
    6. [Cloning and deleting](reference/actions/cloning_deleting.md)
3. [Custom data types](reference/data_types/index.md)
4. [Libraries](reference/libraries/index.md)
5. [Node.js `ellipsis` object](reference/ellipsis_object/index.md)
6. [Ellipsis API](reference/ellipsis_api/index.md)
7. [Third-party APIs](reference/third_party_apis/index.md)
8. [Environment variables](reference/environment_variables.md)

## Cookbook
The Cookbook focuses on specific problems your are facing when building new Skills
or customizing existing ones.

1. Interfacing with external Services and APIs
    1. [Using Async APIs](cookbook/async_api.md)

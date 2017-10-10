# Developer's guide to Ellipsis.ai

## Reference

The reference explains the core concepts and features of Ellipsis, a tool to perform tasks, work with data, and answer questions in chat.

Ellipsis learns how to respond using “skills”, which can be installed or created from scratch. A skill is a collection of one or more “actions” that perform a task and/or return a response. Typically, all of the actions in a skill are related in some way, by theme or by the kind of data they use.

1. [Skills](skills/index.md)
    1. [Version history](skills/index.md#version-history)
    2. [Title, description, and icon](skills/index.md#skill-details-the-title-description-and-icon)
    3. [Installing, cloning, merging, deleting](skills/management.md)
    4. [Exporting and importing](skills/index.md#exporting-skills)
2. [Actions](actions/index.md)
    1. [Triggers](actions/triggers.md)
    2. [Inputs](actions/inputs.md)
    3. [Node.js function](actions/function.md)
    4. [Response template](actions/template.md)
    5. [Testing](actions/testing.md)
    6. [Cloning and deleting](actions/cloning_deleting.md)
3. [Custom data types](data_types/index.md)
4. [Libraries](libraries/index.md)
5. [Node.js `ellipsis` object](ellipsis_object/index.md)
6. [Ellipsis API](ellipsis_api/index.md)
7. [Third-party APIs](third_party_apis/index.md)
8. [Environment variables](environment_variables.md)

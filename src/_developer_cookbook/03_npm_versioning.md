---
title: NPM Versioning
number: 3
---

## Problem
You want to use a specific version of an NPM package in an Ellipsis action.

## Solution
You can use the following syntax in the action code:

```javascript
const p = ellipsis.require("package_name@version_string");
```

For instance to use _moment_ version 2.10.8 you would write:

```javascript
const moment = ellipsis.require("moment@2.10.8");
```

To get the version tagged _beta_ you would use:

```javascript
const moment = ellipsis.require("moment@beta");
```

After you choose the desired NPM package version and re-save the action,
the panel showing Required NPM Modules will automatically update to indicate the new version.


## Discussion
In most cases, you will want to use the latest version of an NPM package. In that case
you can use the standard Node `require` syntax. Ellipsis will install the latest version for you.

```javascript
const moment = require('moment');
```

## See also
* [NPM Semantic Versioning](https://docs.npmjs.com/getting-started/semantic-versioning)

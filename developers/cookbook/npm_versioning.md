# Npm Versioning

## Problem
You want to use a specific version on a npm package in an Action code.

## Solution
You can use the following syntax in the Action code:
```
const p = ellipsis.require("package_name@version_string");
```

For instance to use _moment_ version 2.10.8 you would write:
```
const moment = ellipsis.require("moment@2.10.8");
```
To get the version tagged _beta_ you would use:
```
const moment = ellipsis.require("moment@beta");
```

After you chose the desired Npm package version and you re-save the Action,
the Required Npm Module panel will automatically update to reflect the new version.


## Discussion
In most cases, you will want to use the latest version of a Npm package. In that case
you should use the standard Node require syntax:
```
const moment = require('moment');
```


## See Also
* [Npm Semantic Versioning](https://docs.npmjs.com/getting-started/semantic-versioning)

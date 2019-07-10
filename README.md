
[![CircleCI](https://circleci.com/gh/ellipsis-ai/ellipsis-ai.github.io/tree/master.svg?style=svg&circle-token=bcbf1fb20a79a53234c2b9fee2bb90acfe117a72)](https://circleci.com/gh/ellipsis-ai/ellipsis-ai.github.io/tree/master)

# Overview
This is the developer guide and the developer reference for the Ellipsis platform. It is a static website generated with Jekyll.

# Editing the guide
The guide is written in Markdown.
To edit the guide, clone this repo and start Jekyll using [Docker](https://www.docker.com/community-edition#/download):

```bash
$ docker-compose up
```
Open the browser at http://0.0.0.0:4000.

# Deployment
To deploy to production the push to the changes to the prod branch. CircleCI will generate the website and deploy it to an S3 bucket. 
There is no staging environment for the website.

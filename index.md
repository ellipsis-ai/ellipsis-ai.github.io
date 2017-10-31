---
title: Ellipsis Guide
---

Welcome to the Ellipsis Guide, a reference for how to use Ellipsis.ai. Use the table of contents to navigate through the guide.

## Editing the guide

To edit the guide, clone this repo and set up `jekyll` to run locally:

1. Ruby 2.4.1 is preferred. You can install it using rbenv, if you have it (`brew install rbenv`).

    ```bash
    $ rbenv install 2.4.1
    $ rbenv local 2.4.1
    ```

2. If you don't already have it, you need Bundler.

    ```bash
    $ gem install bundler
    ```

3. Install dependencies using Bundler.

    ```bash
    $ bundle install
    ```

4. Optional step: set up authentication with GitHub by adding a personal token and an SSL certificate.

    [Read instructions](http://idratherbewriting.com/documentation-theme-jekyll/mydoc_install_jekyll_on_mac.html#githuberror)

5. Run jekyll to build the site and see it locally at http://localhost:4000/

    ```bash
    $ bundle exec jekyll serve
    ```


# flatiron-handlers

[![build status](https://secure.travis-ci.org/twilson63/flatiron-handlers.png)](http://travis-ci.org/twilson63/flatiron-handlers)

Flatiron Handlers is a flatiron http plugin provides the following
methods to the flatiron http application:

## Install

`npm install flatiron-handlers`

## Usage

``` coffeescript
flatiron = require 'flatiron'
handlers = require 'flatiron-handlers'
app = flatiron.app

app.use flatiron.plugins.http
app.use handlers

app.router.get '/', ->
  app.plain res, 'foo'

```

## API

## app.text(res, text)

Parameter  |  Type  | Required    |  Description
-----------|--------|-------------|-------------
res        | Object | yes         | http response object
text       | string | yes         | text to send in response

example

``` coffeescript
app.router.get '/', -> app.text @res, 'foobar'
```

``` javascript
app.router.get('/', function() { return app.text(@res, 'foobar') });
```

## app.html(res, html)

Parameter  |  Type  | Required    |  Description
-----------|--------|-------------|--------------
res        | Object | yes         | Response Object
html       | string | yes         | Html to return to response

example: see Source

## app.redirect(res, location)

Parameter  |  Type  | Required    |  Description
-----------|--------|-------------|--------------
res        | Object | yes         | Response Object
location   | string | yes         | location to redirect to

example: see Source

## app.json(res, data, status)

Parameter  |  Type  | Required    |  Description
-----------|--------|-------------|--------------
res        | Object | yes         | Response Object
data       | Object | yes         | JSON to return to response
status     | integer| no          | status code to return with json response

example: see Source

# roadmap

check [issues][1]

# contribute

everyone is welcome to contribute. patches, bugfixes, new features

1. create an [issue][1] on github so the community can comment on your idea
2. fork `flatiron-handlers` in github
3. create a new branch `git checkout -b my_branch`
4. create tests for the changes you made
5. make sure you pass both existing and newly inserted tests
6. commit your changes
7. push to your branch `git push origin my_branch`
8. create an pull request

# tests

``` sh
npm install mocha -g
npm install
npm test

```

# license

see LICENSE

[1]: http://github.com/twilson63/nano/issues
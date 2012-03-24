broadway = require 'broadway'
handlers = require '..'

describe 'handlers#json', ->
  it 'should handle json', ->
    res =
      writeHead: (code, headers) ->
        res.headers = headers
        res.headers.code = code
      end: (data) ->
        res.body = data

    app = new broadway.App()
    app.use handlers
    app.json res, foo: 'bar', 201
    res.headers.code.should.equal 201
    res.headers['content-type'].should.equal 'application/json'
    res.body.should.equal JSON.stringify(foo: 'bar')

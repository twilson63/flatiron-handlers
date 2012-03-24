broadway = require 'broadway'
handlers = require '..'

describe 'handlers#plain', ->
  it 'should handle plain text', ->
    res =
      writeHead: (code, headers) ->
        res.headers = headers
        res.headers.code = code
      end: (data) ->
        res.body = data

    app = new broadway.App()
    app.use handlers
    app.plain res, 'foo'
    res.headers.code.should.equal 200
    res.headers['content-type'].should.equal 'text/plain'
    res.body.should.equal 'foo'

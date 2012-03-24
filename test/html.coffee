broadway = require 'broadway'
handlers = require '..'

describe 'handlers#html', ->
  it 'should handle html', ->
    res =
      writeHead: (code, headers) ->
        res.headers = headers
        res.headers.code = code
      end: (data) ->
        res.body = data

    app = new broadway.App()
    app.use handlers
    app.html res, '<h1>foo</h1>'
    res.headers.code.should.equal 200
    res.headers['content-type'].should.equal 'text/html'
    res.body.should.equal '<h1>foo</h1>'

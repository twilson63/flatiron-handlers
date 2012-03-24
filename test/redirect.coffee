broadway = require 'broadway'
handlers = require '..'

describe 'handlers#plain', ->
  it 'should handle plain text', ->
    res =
      writeHead: (code, headers) ->
        res.headers = headers
        res.headers.code = code
      end: -> true
    app = new broadway.App()
    app.use handlers
    app.redirect res, '/'
    res.headers.code.should.equal 303
    res.headers.Location.should.equal '/'

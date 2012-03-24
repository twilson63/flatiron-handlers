# # flatiron-handlers
# install
#
#     npm install flatiron-handlers
#
# usage
#
#     flatiron = require 'flatiron'
#     handlers = require 'flatiron-handlers'
#     app = flatiron.app
#     
#     app.use flatiron.plugins.http
#     app.use handlers
#     
#     app.router.get '/', ->
#       app.plain res, 'foo'
#
   
# ## Contants
PLAIN = 'text/plain'
HTML = 'text/html'
APP_JSON = 'application/json'

# # Public methods
exports.attach = (options) ->
  # ## app.plain(res, text)
  #
  #      Parameter  |  Type  | Required    |  Description    
  #      -----------|--------|-------------|-------------    
  #      res        | Object | yes         | http response object    
  #      text       | string | yes         | text to send in response    
  # 
  # example
  # 
  #     app.router.get '/', -> 
  #       app.text @res, 'foobar'
  # 
  # 
  #     app.router.get('/', function() { 
  #        return app.text(this.res, 'foobar') 
  #     });
  # 
  @plain = (res, text) ->
    res.writeHead 200, 'content-type': PLAIN
    res.end text

  # ## app.html(res, html)
  #
  #     Parameter  |  Type  | Required    |  Description    
  #     -----------|--------|-------------|--------------   
  #     res        | Object | yes         | Response Object    
  #     html       | string | yes         | Html to return to response   
  # 
  # example
  # 
  #     app.router.get '/', -> 
  #       app.html @res, '<h1>foobar</h1>'
  # 
  # 
  #     app.router.get('/', function() { 
  #        return app.html(this.res, '<h1>foobar</h1>') 
  #     });
  @html = (res, html) ->
    res.writeHead 200, 'content-type': HTML
    res.end html

  # ## app.redirect(res, location)
  #
  #     Parameter  |  Type  | Required    |  Description    
  #     -----------|--------|-------------|--------------   
  #     res        | Object | yes         | Response Object    
  #     location   | string | yes         | Html to return to response   
  # 
  # example
  # 
  #     app.router.get '/foo', -> 
  #       app.redirect @res, '/'
  # 
  # 
  #     app.router.get('/', function() { 
  #        return app.redirect(this.res, '/') 
  #     });
  @redirect = (res, location) ->
    res.writeHead 303, Location: location
    res.end()

  # ## app.json(res, data, status)
  # 
  #     Parameter  |  Type  | Required    |  Description
  #     -----------|--------|-------------|--------------
  #     res        | Object | yes         | Response Object
  #     data       | Object | yes         | JSON to return to response
  #     status     | integer| no          | status code to return with json response
  # 
  # example
  # 
  #     app.router.get '/foo', -> 
  #       app.json @res, foo: 'bar'
  # 
  # 
  #     app.router.get('/', function() { 
  #        return app.json(this.res, { foo: 'bar' })
  #     });
  @json = (res, data, status=200) ->
    res.writeHead status, 'content-type': APP_JSON
    res.end JSON.stringify(data)
exports.init = (done) -> done()

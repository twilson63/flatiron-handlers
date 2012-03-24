var APP_JSON, HTML, PLAIN;

PLAIN = 'text/plain';

HTML = 'text/html';

APP_JSON = 'application/json';

exports.attach = function(options) {
  this.plain = function(res, text) {
    res.writeHead(200, {
      'content-type': PLAIN
    });
    return res.end(text);
  };
  this.html = function(res, html) {
    res.writeHead(200, {
      'content-type': HTML
    });
    return res.end(html);
  };
  this.redirect = function(res, location) {
    res.writeHead(303, {
      Location: location
    });
    return res.end();
  };
  return this.json = function(res, data, status) {
    if (status == null) status = 200;
    res.writeHead(status, {
      'content-type': APP_JSON
    });
    return res.end(JSON.stringify(data));
  };
};

exports.init = function(done) {
  return done();
};

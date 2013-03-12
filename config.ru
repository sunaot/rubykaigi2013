# encoding: utf-8

require 'rack/contrib/try_static'

use Rack::TryStatic,
  :root => 'build',
  :Urls => ['/'],
  :try  => ['.html', 'index.html', '/index.html']

run lambda {|env| [404, {'Content-Type' => 'text/plain'}, ['Not found!']] }

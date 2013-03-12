# encoding: utf-8

require 'rack/contrib/try_static'

use Rack::TryStatic,
  :root => File.expand_path('../build', __FILE__),
  :urls => ['/'],
  :try  => ['.html', 'index.html', '/index.html']

run lambda {|env| [404, {'Content-Type' => 'text/plain'}, ['Not found!']] }

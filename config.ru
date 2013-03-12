# encoding: utf-8

require 'rack/contrib/static_cache'
require 'rack/contrib/try_static'

root_path = File.expand_path('../build', __FILE__)

use Rack::StaticCache,
  root: root_path,
  urls: %w(javascripts stylesheets images).map {|path| "/2013/#{path}" },
  versioning: false

use Rack::TryStatic,
  root: root_path,
  urls: ['/'],
  try:  ['.html', 'index.html', '/index.html']

run lambda {|env| [404, {'Content-Type' => 'text/plain'}, ['Not found!']] }

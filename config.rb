activate :directory_indexes

set :css_dir,    '2013/stylesheets'
set :js_dir,     '2013/javascripts'
set :images_dir, '2013/images'

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash, ignore: [%r{^2013/images/(?:banner|badge)}]
end

data.sessions.keys.each do |id|
  proxy "/2013/session/#{id}.html", '/2013/session.html', locals: {id: id}
end
ignore '/2013/session.html'

helpers do
  def gravatar_tag(id, size, options = {})
    image_tag("http://www.gravatar.com/avatar/#{id}?s=#{size}&d=http%3A%2F%2Frubykaigi.org%2F2013%2FcommonNoImage.png", {width: size, height: size}.merge(options))
  end
end

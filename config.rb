set :site_title, 'J2B'
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

ignore '*.psd'

helpers do
  def inline_script(name)
    js = sprockets["#{name}.js"].to_s

    content_tag :script do
      defined?(Uglifier) ? Uglifier.compile(js) : js
    end
  end
end

activate :autoprefixer do |config|
  config.browsers = ['> 1%', 'last 3 versions', 'ie 7', 'ie 8', 'ie 9', 'ff 17', 'opera 12.1']
end

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method   = :rsync
  deploy.host     = 'dialect.ca'
  deploy.path     = '/home/dialect/j2b2.dialect.ca'
  deploy.user     = 'dialect'
end

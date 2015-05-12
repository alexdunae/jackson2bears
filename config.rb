J2B_WORKS = {
  performance: [
    {
      title: 'Iron Tomahawks',
      description: 'In condimentum orci id nisl volutpat bibendum.',
      thumbnail: 'placeholder-x.png',
      url: '/works/iron-tomahawks.html'
    },
    {
      title: 'Heritage Mythologies',
      description: 'In condimentum orci id nisl volutpat bibendum. Quisque commodo hendrerit lorem quis egestas. Maecenas quis tortor arcu. Vivamus rutrum nunc non neque consectetur quis placerat neque lobortis.',
      thumbnail: 'placeholder-x.png',
      url: '/works/heritage-mythologies.html'
    },
    {
      title: 'Conjuration of Joseph Brant ',
      description: 'In condimentum orci id nisl volutpat bibendum. Quisque commodo hendrerit lorem quis egestas. Maecenas quis tortor arcu. Vivamus rutrum nunc non neque consectetur quis placerat neque lobortis.',
      thumbnail: 'placeholder-x.png',
      url: '/works/conjuration-of-joseph-brant.html'
    }
  ]


}

helpers do
  def toc(section)
    works = J2B_WORKS.fetch(section)

    works.map do |work|
      toc_item(work)
    end.join('')

  end

  def toc_item(item)
    style = bg_image(item[:thumbnail])

    label = "<h3 class='toc-title'>#{item[:title]}</h3>"
    label << "<p class='toc-description'>#{item[:description]}</p>"


    content_tag(:li, class: 'toc-item', style: style) do
      link_to label.html_safe, item[:url], class: 'toc-item-inner'
    end
  end

  def bg_image(image_path)
    full_path = asset_path(:png, "/images/#{image_path}")
    "background-image: url('#{full_path}')"
  end
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Build-specific configuration
configure :development do
  activate :livereload
end

configure :build do
  activate :autoprefixer
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :automatic_image_sizes
  set :http_prefix, '/j2b/'
end

activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :rsync
  deploy.host   = 'dialect.ca'
  deploy.path   = '/home/dialect/clients.dialect.ca/j2b'
  deploy.user  = 'dialect'
  deploy.clean = true
end

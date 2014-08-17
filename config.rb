# ========================================================================
# Hello Jason
# http://hellojason.net
# ========================================================================

# Copy ./source/environment_variables.example to ./source/environment_variables.rb
# then update settings there.
require "./source/environment_variables.rb"

# ========================================================================
# Compass
# ========================================================================
# Change Compass configuration
compass_config do |config|
  config.output_style = :compact
  # Require any additional compass plugins here.
  config.add_import_path "bower_components/foundation/scss"
  # Set this to the root of your project when deployed:
  config.http_path = "/"
  config.css_dir = "stylesheets"
  config.sass_dir = "stylesheets"
  config.images_dir = "images"
  config.javascripts_dir = "javascripts"
end


# ========================================================================
# Site settings
# ========================================================================
set :site_title,           "Hello Jason"
set :site_description,     "This is an example meta description."
set :site_url_production,  ENV['site_url_production']
set :site_url_development, ENV['site_url_development']
set :css_dir,              "stylesheets"
set :js_dir,               "javascripts"
set :images_dir,           "images"
set :server,               "thin"

# CSS preprocessor
set :sass, line_comments: false, style: :nested
# Internationalization
activate :i18n
# Use relative URLs
activate :relative_assets
# Pretty URLs
activate :directory_indexes
# Enable Bourbon
#activate :bourbon

# Sitemap URLs (use trailing slashes). Create additional variables here
# for referenceing your pages.
set :url_home,                       "/"
set :url_work,                       "/"
set :url_about,                      "/about/"
set :url_blog,                       "/blog/"
set :url_contact,                    "/contact/"

# ========================================================================
# Page options, layouts, aliases and proxies
# ========================================================================

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html",
# :locals => {:which_fake_page => "Rendering a fake page with a local
# variable" }

# ========================================================================
# Helpers
# ========================================================================

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

helpers do

  # Gets partials from the _partials directory
  def _partial(partial_filename)
    partial "_partials/#{partial_filename}"
  end

  # Formats li item, and determines when to put class=active on li element
  # (according to Bootstrap 3.2 spec)
  def nav_li(label, url, css_class="", icon="")
    # Determine if icon is specified
    nav_icon = ""
    unless icon.nil? or icon.empty?
      nav_icon = " <i class='fa #{icon}'></i>"
    end
    # Normalize name string for use as HTML class
    li_classes = ""
    unless css_class.nil? or css_class.empty?
      # Assign processed name to variable
      li_classes = "#{css_class}"
    else
      label_formatted = label.downcase.tr(" ", "-")
      li_classes = "nav-item-#{label_formatted}"
    end
    if current_page.url == url
      li_classes += " active"
    end

    "<li class='#{li_classes}'><a href='#{url}'>#{label}#{nav_icon}</a></li>"
  end

  # Project thumbnails
  def project_thumb(title, slug, thumb_img)
    # thumb_url = "http://placehold.it/500x500"
    thumb_url = "#{images_dir}/thumbnails/#{thumb_img}"
    "<figure>
      <a href='#{slug}'>
        <figcaption>
          <h3>#{title}</h3>
          <span class='view'>&mdash;view&mdash;
        </figcaption>
        <img src='#{thumb_url}' alt='#{title}'>
      </a>
    </figure>"
  end

end

# ========================================================================
# Development-specific configuration
# ========================================================================
configure :development do
  set :site_url, "#{site_url_development}"
  # Reload the browser automatically whenever files change
  activate :livereload
end

# ========================================================================
# Build-specific configuration
# ========================================================================
configure :build do
  set :site_url, "#{site_url_production}"
  set :sass, style: :compressed
  activate :minify_css
  activate :minify_html
  activate :minify_javascript
  activate :gzip
  # Enable cache buster
  activate :asset_hash, :exts => ['.css', '.png', '.jpg', '.gif']
  # Create favicon and device-specific icons
  activate :favicon_maker, :icons => {
    "favicon_template.png" => [
      { icon: "apple-touch-icon-152x152-precomposed.png" },
      { icon: "apple-touch-icon-144x144-precomposed.png" },
      { icon: "apple-touch-icon-120x120-precomposed.png" },
      { icon: "apple-touch-icon-114x114-precomposed.png" },
      { icon: "apple-touch-icon-76x76-precomposed.png" },
      { icon: "apple-touch-icon-72x72-precomposed.png" },
      { icon: "apple-touch-icon-60x60-precomposed.png" },
      { icon: "apple-touch-icon-57x57-precomposed.png" },
      { icon: "apple-touch-icon-precomposed.png", size: "57x57" },
      { icon: "apple-touch-icon.png", size: "57x57" },
      { icon: "favicon-196x196.png" },
      { icon: "favicon-160x160.png" },
      { icon: "favicon-96x96.png" },
      { icon: "favicon-32x32.png" },
      { icon: "favicon-16x16.png" },
      { icon: "favicon.png", size: "16x16" },
      { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" },
      { icon: "mstile-144x144", format: "png" },
    ]
  }
end

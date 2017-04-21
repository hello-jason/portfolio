# ========================================================================
# Hello Jason
# http://hellojason.net
# ========================================================================

# Copy ./source/environment_variables.example to ./source/environment_variables.rb
# then update settings there.
require "./source/environment_variables.rb"

# ========================================================================
# Site settings
# ========================================================================
config[:site_url]       = 'http://localhost:4567/'
config[:site_title]       = 'Hello Jason'
config[:site_description] = 'Design and development portfolio of Jason Cross'

# Set asset directories
config[:css_dir]      = '/assets/stylesheets'
config[:js_dir]       = '/assets/javascripts'
config[:images_dir]   = '/assets/images'
config[:fonts_dir]    = '/assets/fonts'
config[:layouts_dir]  = '/layouts'

# Use relative URLs
activate :relative_assets
# Sitemap URLs (use trailing slashes). Create additional variables here
# for referencing your pages.
config[:url_portfolio] = '/projects/'
config[:url_projects]  = '/projects/'
config[:url_about]     = '/about/'
config[:url_blog]      = '/'
config[:url_home]      = '/'

# ========================================================================
# Layouts
# ========================================================================
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false


# ========================================================================
# Activate and configure extensions
# ========================================================================
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

# Slim template engine
require "slim"

# Bootstrap
require "bootstrap-sass"

# Autoprefixer
activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# ========================================================================
# Weblog extension
# Documentatin: http://middlemanapp.com/basics/blogging/
# ========================================================================
Time.zone = "America/Chicago"
activate :blog do |blog|
  blog.default_extension    = ".md"
  blog.permalink            = "{title}"
  blog.prefix               = "blog"
  blog.layout               = "layout-article"
  # Custom template when running `middleman article "Article name"`
  blog.new_article_template = "source/layouts/article.tt"
end

# Pretty URLs
# This must be activated AFTER the blog extension
activate :directory_indexes


# Build-specific configuration
# ========================================================================
configure :build do
  # Ignore file/dir during build process
  ignore ".git"
  ignore "environment_variables.rb"
  ignore "environment_variables.sample.rb"
  ignore "favicon_template.png"
  ignore "article.tt"
  ignore "imageoptim.manifest.yml"

  set :site_url, "#{site_url_production}"

  # Optimization
  set :sass, line_comments: false, style: :compressed
  activate :minify_css
  activate :minify_html
  activate :minify_javascript
  activate :gzip

  # Cache buster
  activate :asset_hash, :exts => ['.css', '.js']

  # Compress and optimise images during build
  # Documentation: https://github.com/plasticine/middleman-imageoptim
  activate :imageoptim do |options|
    # Use a build manifest to prevent re-compressing images between builds
    options.manifest = false
    # Image extensions to attempt to compress
    options.image_extensions = %w(.jpg .gif .svg)
    # Cause image_optim to be in shouty-mode
    options.verbose = false
  end

  # Disqus comments
  activate :disqus do |d|
    # using a different shortname for production builds
    d.shortname = "hellojason"
  end

  # Create favicon and device-specific icons
  activate :favicon_maker, :icons => {
    "favicon_template.png" => [
      { icon: "apple-touch-icon-152x152-precomposed.png" },        # Same as apple-touch-icon-57x57.png, for retina iPad with iOS7.
      { icon: "apple-touch-icon-144x144-precomposed.png" },        # Same as apple-touch-icon-57x57.png, for retina iPad with iOS6 or prior.
      { icon: "apple-touch-icon-120x120-precomposed.png" },        # Same as apple-touch-icon-57x57.png, for retina iPhone with iOS7.
      { icon: "apple-touch-icon-114x114-precomposed.png" },        # Same as apple-touch-icon-57x57.png, for retina iPhone with iOS6 or prior.
      { icon: "apple-touch-icon-76x76-precomposed.png" },          # Same as apple-touch-icon-57x57.png, for non-retina iPad with iOS7.
      { icon: "apple-touch-icon-72x72-precomposed.png" },          # Same as apple-touch-icon-57x57.png, for non-retina iPad with iOS6 or prior.
      { icon: "apple-touch-icon-60x60-precomposed.png" },          # Same as apple-touch-icon-57x57.png, for non-retina iPhone with iOS7.
      { icon: "apple-touch-icon-57x57-precomposed.png" },          # iPhone and iPad users can turn web pages into icons on their home screen. Such link appears as a regular iOS native application. When this happens, the device looks for a specific picture. The 57x57 resolution is convenient for non-retina iPhone with iOS6 or prior. Learn more in Apple docs.
      { icon: "apple-touch-icon-precomposed.png", size: "57x57" }, # Same as apple-touch-icon.png, expect that is already have rounded corners (but neither drop shadow nor gloss effect).
      { icon: "apple-touch-icon.png", size: "57x57" },             # Same as apple-touch-icon-57x57.png, for "default" requests, as some devices may look for this specific file. This picture may save some 404 errors in your HTTP logs. See Apple docs
      { icon: "favicon-196x196.png" },                             # For Android Chrome M31+.
      { icon: "favicon-160x160.png" },                             # For Opera Speed Dial (up to Opera 12; this icon is deprecated starting from Opera 15), although the optimal icon is not square but rather 256x160. If Opera is a major platform for you, you should create this icon yourself.
      { icon: "favicon-96x96.png" },                               # For Google TV.
      { icon: "favicon-32x32.png" },                               # For Safari on Mac OS.
      { icon: "favicon-16x16.png" },                               # The classic favicon, displayed in the tabs.
      { icon: "favicon.png", size: "16x16" },                      # The classic favicon, displayed in the tabs.
      { icon: "favicon.ico", size: "64x64,32x32,24x24,16x16" },    # Used by IE, and also by some other browsers if we are not careful.
      { icon: "mstile-70x70.png", size: "70x70" },                 # For Windows 8 / IE11.
      { icon: "mstile-144x144.png", size: "144x144" },
      { icon: "mstile-150x150.png", size: "150x150" },
      { icon: "mstile-310x310.png", size: "310x310" },
      { icon: "mstile-310x150.png", size: "310x150" }
    ]
  }
end

configure :build do
  config[:site_url]       = 'https://hellojason.net'
end

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


# ========================================================================
# Development-specific configuration
# ========================================================================
configure :development do
  # Disqus comments
  activate :disqus do |d|
    # using a special shortname
    d.shortname = "hello-jason-dev"
    # or setting to `nil` will stop Disqus loading
    # d.shortname = nil
  end
end


# ========================================================================
# Build-specific configuration

configure :build do
  config[:host]       = 'https://hellojason.net'

  # Disqus comments
  activate :disqus do |d|
    # using a different shortname for production builds
    d.shortname = "hellojason"
  end
end

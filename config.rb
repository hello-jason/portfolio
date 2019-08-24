# ========================================================================
# Hello Jason
# http://hellojason.net
# ========================================================================

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

# Markdown rendering
activate :syntax, :line_numbers => true
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

# ========================================================================
# Weblog extension
# Documentation: http://middlemanapp.com/basics/blogging/
# ========================================================================
Time.zone = "America/Chicago"
activate :blog do |blog|
  blog.default_extension    = ".md"
  blog.permalink            = "{title}"
  blog.prefix               = "blog"
  blog.layout               = "layout-article"
  # Custom template when running `middleman article "Article name"`
  blog.new_article_template = "~/Sites/portfolio/source/layouts/article.tt"
end

# Pretty URLs
# This must be activated AFTER the blog extension
activate :directory_indexes
page "/404.html", :directory_index => false


# ========================================================================
# Development-specific configuration
# ========================================================================
configure :development do
end


# ========================================================================
# Build-specific configuration

configure :build do
  config[:site_url]   = 'https://hellojason.net/'
  config[:host]       = 'https://hellojason.net/'

  # Ignore file/dir during build process
  ignore "layouts/*"
  ignore "**/.keep"
  ignore "all-methods.*"

  # Optimization
  set :sass, line_comments: false, style: :compressed
  activate :minify_html
  activate :minify_css
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
    options.image_extensions = %w(.jpg .gif .svg .png)
    # Cause image_optim to be in shouty-mode
    options.verbose = false
  end

end

# ========================================================================
# Deploy-specific configuration
# Documentation: https://github.com/middleman-contrib/middleman-deploy
# ========================================================================
case ENV['TARGET'].to_s.downcase
  #
  # rake deploy:production
  #
  when 'production'
    activate :deploy do |deploy|
      deploy.build_before = false # build happens in rake task
      deploy.deploy_method = :git
      deploy.remote   = 'origin'
      deploy.branch   = 'gh-pages'
      deploy.strategy = :force_push
      deploy.clean = true
    end
  #
  # rake deploy:staging
  #
  when 'staging'
    activate :deploy do |deploy|
      deploy.build_before = false # build happens in rake task
      deploy.deploy_method = :git
      deploy.remote   = 'origin'
      deploy.branch   = 'staging'
      deploy.strategy = :force_push
      deploy.clean = true
    end

  else
    activate :deploy do |deploy|
      deploy.build_before = false # build happens in rake task
      deploy.deploy_method = :git
      deploy.remote   = 'origin'
      deploy.branch   = 'other'
      deploy.strategy = :force_push
      deploy.clean = true
    end
  end
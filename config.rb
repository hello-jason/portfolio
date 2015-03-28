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
set :site_title,           "Hello Jason"
set :site_description,     "Design and development portfolio of Jason Cross"
set :site_url_production,  ENV['site_url_production']
set :site_url_development, ENV['site_url_development']
set :css_dir,              "css"
set :js_dir,               "js"
set :images_dir,           "img"

# Sitemap URLs (use trailing slashes). Create additional variables here
# for referenceing your pages.
set :url_home,                       "/"
set :url_portfolio,                  "/"
set :url_about,                      "/about/"
set :url_blog,                       "/blog/"
set :url_contact,                    "/contact/"

# Sitemap XML
require "builder"
page "/sitemap.xml", :layout => false

# Slim template engine
require "slim"

# Use relative URLs
activate :relative_assets

# Autoprevixer
activate :autoprefixer do |config|
  config.browsers = ['last 2 versions', 'Explorer >= 9']
  config.cascade  = false
  config.inline   = false
end

# Markdown rendering
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

# Syntax highlighting
# Documentation: https://github.com/jneen/rouge
activate :rouge_syntax

# Weblog extension
# Documentatin: http://middlemanapp.com/basics/blogging/
activate :blog do |blog|
  blog.default_extension  = ".md"
  blog.permalink          = "{title}"
  blog.prefix             = "blog"
  blog.layout             = "layout"
end

# Pretty URLs
# This must be activated AFTER the blog extension
activate :directory_indexes

# ========================================================================
# Helpers
# ========================================================================
helpers do

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
  def project_thumb(title, slug, thumb_img, year)
    # thumb_url = "http://placehold.it/500x500"
    thumb_url = "#{images_dir}/thumbnails/#{thumb_img}"
    "<figure>
      <a href='#{slug}'>
        <figcaption>
          <h3>#{title}</h3>
          <span class='year'>#{year}</span>
          <span class='view'>&mdash;view&mdash;
        </figcaption>
        <img src='#{thumb_url}' alt='#{title}'>
      </a>
    </figure>"
  end

  # Project details
  def project_details(year, software, roles)
    "<dl>
      <dt>Client</dt>
      <dd>#{current_page.data.title}</dd>
      <dt>Year</dt>
      <dd>#{year}</dd>
      <dt>Software</dt>
      <dd>#{software}</dd>
      <dt>Roles</dt>
      <dd>#{roles}</dd>
    </dl>
    <hr>"
  end

end

# ========================================================================
# Development-specific configuration
# ========================================================================
configure :development do
  set :site_url, "#{site_url_development}"
  # Reload the browser automatically whenever files change
  activate :livereload
  #set :server, "thin"
end

# ========================================================================
# Build-specific configuration
# ========================================================================
configure :build do
  set :site_url, "#{site_url_production}"
  set :sass, line_comments: false, style: :compressed

  activate :minify_css
  # activate :minify_html
  activate :minify_javascript
  activate :gzip

  # Enable cache buster
  activate :asset_hash, :exts => ['.css', '.png', '.jpg', '.gif']

  # Ignore files/dir during build process
  ignore ".git"
  ignore "environment_variables.rb"
  ignore "environment_variables.rb.sample"
  ignore "favicon_template.png"
  ignore "sitemap.yml"
  ignore "sitemap.xml.builder"

  # Compress and optimise images during build
  # Documentation: https://github.com/plasticine/middleman-imageoptim
  activate :imageoptim do |options|
  # Use a build manifest to prevent re-compressing images between builds
  options.manifest = false
    # Image extensions to attempt to compress
    options.image_extensions = %w(.png .jpg .gif .svg)
    # Cause image_optim to be in shouty-mode
    options.verbose = false
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

# ========================================================================
# Deploy-specific configuration
# Documentation: https://github.com/hello-jason/middleman-deploy#git-eg-github-pages
# ========================================================================
activate :deploy do |deploy|
  deploy.build_before = true
  deploy.method = :git
  deploy.remote   = 'origin'
  deploy.branch   = 'gh-pages'
  deploy.strategy = :force_push
  # deploy.commit_message = 'custom-message'      # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
end

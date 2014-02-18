###
# Settings
###
set :site_title, "Jason Cross"
set :site_url, "http://hellojason.net"
set :site_description, "Portfolio website of designer Jason Cross."
require 'bootstrap-sass'
###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

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

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

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

  ###
  # Markup Helpers
  ###

  # Sets name of the thumbnails section on single project pages
  def details_title
    "A Closer Look"
  end

  # Progress bar with label (string, number)
  def progress(string, integer)
    "
    <div class='progress-item'>
      <p class='progress-name'>#{string}</p>
      <div class='progress'>
        <div class='progress-bar nobar' aria-valuemax='100' aria-valuemin='0' aria-valuenow='#{integer}' role='progressbar' style='width: #{integer}%;'>
          <span class='sr-only'>#{integer}%</span>
        </div>
      </div>
    </div>
    "
  end

  def project_info
    project_client    = current_page.data.project_client
    project_year      = current_page.data.project_year
    project_status    = current_page.data.project_status
    project_tech      = current_page.data.project_tech
    project_url       = current_page.data.project_url
    "
    <div class='client-info'>
      <dl>
        <dt>Client</dt>
        <dd>#{project_client}</dd>
        <dt>Year</dt>
        <dd>#{project_year}</dd>
        <dt>Tools</dt>
        <dd>#{project_tech || "n/a"}</dd>
        <dt>Status</dt>
        <dd>#{project_status || "n/a"}</dd>
        <dt>URL</dt>
        <dd><a href='#{project_url}'>Visit website</a> <i class='fa fa-external-link'></i></dd>
      </dl>
    </div>
    "
  end

  def project_role_badges
    designer        = current_page.data.designer
    frontend        = current_page.data.frontend
    project_manager = current_page.data.project_manager

    roles = [
      [designer, "Designer", "fa-picture-o"],
      [frontend, "Frontend", "fa-cog"],
      [project_manager, "Project Manager", "fa-users"]
    ]

    roles.each do |role, string, icon|
      if role==1
        "<i class='fa #{icon}'></i> #{string}"
      end
    end
  end
  
end

# Remove .html extension from pages
activate :directory_indexes
activate :i18n
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true

set :haml, { :ugly => false, :format => :html5 }
set :sass, line_comments: false, style: :nested

###
# Assets
###

set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'img'

# Build-specific configuration
configure :build do
  set :sass, style: :compressed
  activate :minify_css
  #activate :minify_html
  activate :minify_javascript
  activate :gzip
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

  # Enable cache buster
  activate :asset_hash, :exts => ['.css', '.png', '.jpg', '.gif']

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

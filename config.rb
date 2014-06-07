###
# Settings
###
set :site_title, "Jason Cross"
set :site_description, "Portfolio website of graphic designer & UI developer Jason Cross."
set :site_url_development,  "http://leonardo.hellojason.net:4567"
set :site_url_production,   "http://hellojason.net"
# Use builder gem to generate XML sitemap
require "builder"
# Remove default layout for sitemap page
page "/sitemap.xml", :layout => false

###
# Helpers
###
helpers do

  # Gets partials from the _partials directory
  def _partial(partial_filename)
    partial "_partials/#{partial_filename}"
  end

  # Usage: portfolio_piece "Company Name", "slug", "thumbnail.jpg"
  def portfolio_piece(company_name, slug, image)
    "
    <div class='piece'>
      <a href='#{site_url}/#{slug}'>
        <span class='piece-name'>#{company_name}</span>
        <img src='/#{images_dir}/#{image}' alt='#{company_name}' width='500' height='500'>
      </a>
    </div>
    "
  end

  # Display responsive images.
  # Usage: img_responsive "small_image.jpg", "medium_image.jpg"
  def img_responsive(image_small, image_medium)
    "
    <img src='/#{images_dir}/#{image_small}' data-medium='#{images_dir}/#{image_medium}'>
    "
  end
  
  # Mustang photo gallery
  def mustang_image(image_name)
    "
    <a rel='car_mustang' href='/#{images_dir}/cars/mustang_#{image_name}.jpg'>
      <img src='/#{images_dir}/cars/thumbs/thumbs_mustang_#{image_name}.jpg'>
    </a>
    "
  end

  # Sets name of the thumbnails section on single project pages
  def details_title
    "A Closer Look"
  end

  # Progress bar with label (string, number)
  def skill(skill_name, percentage, explanation)
    "
    <div class='progress-item' data-toggle='popover' data-placement='top' data-trigger='hover' data-content='#{explanation}'>
      <p class='progress-name'>#{skill_name} <i class='icon-help-circled'></i></p>
      <div class='progress'>
        <div class='progress-bar nobar' aria-valuemax='100' aria-valuemin='0' aria-valuenow='#{percentage}' role='progressbar' style='width: #{percentage}%;'>
          <span class='sr-only'>#{percentage}%</span>
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

    unless project_url.nil? or project_url.empty?
      project_link    = "<a target='_blank' href='#{project_url}'>Visit website</a> <i class='icon-link-ext'></i>"
    end

    "
    <div class='client-info'>
      <dl>
        <dt>Client</dt>
        <dd>#{project_client}</dd>
        <dt>Year</dt>
        <dd>#{project_year}</dd>
        <dt>Software</dt>
        <dd>#{project_tech || "n/a"}</dd>
        <dt>Status</dt>
        <dd>#{project_status || "n/a"}</dd>
        <dt>URL</dt>
        <dd>#{project_link || "n/a"}</dd>
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
activate :i18n
activate :directory_indexes
set :markdown_engine, :redcarpet
set :markdown, :fenced_code_blocks => true, :smartypants => true
set :haml, { :ugly => false, :format => :html5 }
set :sass, line_comments: false, style: :nested

# Assets
set :css_dir, "css"
set :js_dir, "js"
set :images_dir, "img"


# Development-specific configuration
configure :development do
  set :site_url, "#{site_url_development}"
end


# Build-specific configuration
configure :build do
  set :site_url, "#{site_url_production}"
  set :sass, style: :compressed
  activate :minify_css
  #activate :minify_html
  activate :minify_javascript
  activate :gzip
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

  # Enable cache buster
  #activate :asset_hash, :exts => ['.css', '.png', '.jpg', '.gif']
  activate :asset_hash, :exts => ['.css']

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

set :site_url, "http://google.com"
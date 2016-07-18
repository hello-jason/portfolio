# Project thumbnails
def project_thumb(title, slug, image, year)
  image_url = "/#{images_dir}/thumbnails/#{image}"
  "<figure>
    <a href='#{url_portfolio}#{slug}'>
      <figcaption>
        <h3>#{title}</h3>
        <span class='view'>&mdash;view&mdash;
      </figcaption>
      <img data-layzr='#{image_url}' alt='#{title}'>
      <noscript><img src='#{image_url}' alt='#{title}'></noscript>
    </a>
  </figure>"
end

# Single project images
def project_image(title, image)
  image_url = "/#{images_dir}/projects/#{image}"
  "<img data-layzr='#{image_url}' alt='#{title}'>
  <noscript><img src='#{image_url}' alt='#{title}'></noscript>"
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

# Image gallery
def image_gallery(image, collection, title="")
  # = image_gallery "car.jpg" "cars" "Nice car!"
  full_image_url = "/#{images_dir}/#{collection}/#{image}"
  thumb_image_url = "/#{images_dir}/#{collection}/thumbs/thumbs_#{image}"
  "<a href='#{full_image_url}' data-rel='lightcase:#{collection}'>
    <img src='#{thumb_image_url}' alt='#{title}' class='img-thumbnail' />
  </a>
  "
end

# iPhone 6 canvas
def iphone6(image, caption)
  # = iphone6 "image.gif", "Something about the image"
  "
  <figure class='iphone6'>
    <img src='/#{images_dir}/#{image}'>
    <figcaption>#{caption}</figcaption>
  </figure>
  "
end

# Big list <li> items
def big_list_li(number, text)
  "<li><span class='number'>#{number}</span> <span class='text'>#{text}</span></li>"
end

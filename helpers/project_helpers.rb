# Project thumbnails
def project_thumb(title, slug, image, year)
  content = "
    <figure>
      <a href='/projects/#{slug}'>
        <figcaption>
          <h3>#{title}</h3>
          <span class='view'>&mdash;view this project&mdash;
        </figcaption>
        <img src='/assets/images/thumbnails/#{image}' alt='#{title} project'>
      </a>
    </figure>"
  content.html_safe
end

# Single project images
def project_image(title, image, cssClass="")
  image_path = "/assets/images/projects/#{image}"
  if cssClass.present?
    addClass = " class='#{cssClass}' "
  end
  content = "
    <img src='#{image_path}' alt='#{title}'#{addClass}>
    <noscript><img src='#{image_path}' alt='#{title}'></noscript>"

  content.html_safe
end

# Project details
def project_details(year, software, roles)
  dl_content = content_tag :dl do
    str = ''
    unless current_page.data.title.empty?
      str += content_tag(:dt, 'Project') + content_tag(:dd, current_page.data.title)
    end
    unless year.empty?
      str += content_tag(:dt, 'Year') + content_tag(:dd, year.to_s)
    end
    unless software.empty?
      str += content_tag(:dt, 'Software') + content_tag(:dd, software)
    end
    unless roles.empty?
      str += content_tag(:dt, 'Roles') + content_tag(:dd, roles)
    end
    str
  end
  dl_content + content_tag(:hr)
end

# Image gallery
def image_gallery(image, collection, title="")
  # = image_gallery "car.jpg" "cars" "Nice car!"
  full_image_url = "/assets/images/#{collection}/#{image}"
  thumb_image_url = "/assets/images/#{collection}/thumbs/thumbs_#{image}"
   content = "<a href='#{full_image_url}' data-rel='lightcase:#{collection}'>
      <img src='#{thumb_image_url}' alt='#{title}' class='img-thumbnail' />
    </a>
    "
  content.html_safe
end

# iPhone 6 canvas
def iphone6(image, caption)
  # = iphone6 "image.gif", "Something about the image"
  content = "
    <figure class='iphone6'>
      <img src='/assets/images/#{image}'>
      <figcaption>#{caption}</figcaption>
    </figure>
    "
  content.html_safe
end

# Big list <li> items
def big_list_li(number, text)
  content = "<li><span class='number'>#{number}</span> <span class='text'>#{text}</span></li>"
  content.html_safe
end

# Windows vs OS X points
# Arguments:
## operatingSystem = [windows] or [osx]
## dichotomy = string. [good] or [bad]
## title = string. Title of the point being made.
## description = string. Description of the point being made.
## image = filename. Filename and filetype of screenshot.
def os_point(operatingSystem="windows",
           dichotomy="good",
           title="Give me a title",
           description="Give me a description",
           screenshot="")

  # Convert title to CSS class name
  title_css = title.downcase.gsub(/[^0-9A-Za-z]/, '-')

  # Determine if Windows or OS X
  if operatingSystem.downcase == "windows"
    os_image = "/#{images_dir}/logo-windows-10.svg"
  elsif operatingSystem.downcase == "osx"
    os_image = "/#{images_dir}/logo-apple.svg"
  end

  # Determine if good or bad
  if dichotomy.downcase == "good"
    icon_image = "/#{images_dir}/icon-check-circle.svg"
  elsif dichotomy.downcase == "bad"
    icon_image = "/#{images_dir}/icon-times-circle.svg"
  end

  # Change width of description container, depending on if has screenshot or not
  screenshot_div = ""
  descColumns = "vs-description"

  if screenshot != ""
    screenshot_div = "
      <div class='vs-screenshot'>
        <img src='/#{images_dir}/articles/#{screenshot}' />
      </div>"
  else
    descColumns = descColumns + " without-image"
  end

  # Begin HTML layout
  "<div class=\"row #{title_css}\">
    <div class=\"vs-score\">
      <img class=\"icon-dichomoty\" src=\"#{icon_image}\" alt=\"#{dichotomy.capitalize} thing\" />
      <img class=\"logo-os\" src=\"#{os_image}\" alt=\"#{operatingSystem.capitalize}\" />
    </div>

    <div class=\"#{descColumns}\">
      <strong>#{title}</strong>
      <p>#{description}</p>
    </div>

  #{screenshot_div}

  </div> <!-- /row -->"
end

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

# Codepen embed
# The slug hash determines which codepen to embed
def codpen(slugHash="", height="500", runPen="auto", defaultTabs="result", user="hellojason")
  "<div class=\"codepen-container\"><p data-height=\"#{height}\" data-theme-id=\"light\" data-slug-hash=\"#{slugHash}\" data-default-tab=\"#{defaultTabs}\" data-user=\"#{user}\" data-embed-version=\"2\""+  (runPen == "click" ? " data-preview=\"true\" " : "") +"class=\"codepen\"></div>"
end

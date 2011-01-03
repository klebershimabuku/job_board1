module ApplicationHelper

  def title
    base_title = "ShigotoDOKO"
    if@title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def logo
    link_to image_tag("logo.png", :alt => "ShigotoDOKO", :class => "round"), root_path
  end
end

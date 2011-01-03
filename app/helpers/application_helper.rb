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

  def timeago(time, options = {})
    options[:class] ||= "timeago"
    content_tag(:abbr, time.to_s, options.merge(:title => time.getutc.iso8601)) if time
  end

end

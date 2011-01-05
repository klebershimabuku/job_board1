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

  def kind_of_user(user)
    if user.admin?
      content_tag(:span, "Administrator", :style => "color: green;")
    elsif user.announcer?
      content_tag(:span, "Announcer", :style => "color: blue;");
    else
      "Guest"
    end
  end

  def announcer(user)
    if user.announcer?
      alt_text = "It's an announcer"
      image_tag('announcer_ico.gif', :alt => alt_text, :title => alt_text)
    end
  end

  def verify_and_display_correct_changes_on_link(user)
    if user.announcer?
      "Remove announcer status"
    else
      "Promote to announcer!"
    end
  end

  def my_simple_format(value)
    if value.nil?
      '-'
    else
      value.gsub(/\n/, "<br />").html_safe
    end

  end  
end

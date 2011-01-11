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
      content_tag(:span, "Announcer", :style => "color: blue;")
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
  
  def iconify(image_url, title, url_to)
    link_to image_tag(image_url, :title => title), url_to   
  end
  
  def separator
    image_tag('separator.gif')
  end
  
  def page_entries_info(collection, options = {})
    entry_name = options[:entry_name] ||
      (collection.empty?? 'entry' : collection.first.class.name.underscore.sub('_', ' '))
      
    html = if collection.total_pages < 2
              case collection.size
                when 0; "Nenhum #{entry_name.pluralize} encontrado"
                when 1; "Exibindo <b>1</b> #{entry_name}"
              else; "Exibindo <b>todos #{collection.size}</b> #{entry_name.pluralize}"
              end
          else
            %{Exibindo #{entry_name.pluralize} <b>%d&nbsp;-&nbsp;%d</b> de <b>%d</b> no total} % [
            collection.offset + 1,
            collection.offset + collection.length,
            collection.total_entries
            ]
          end
    html = html.html_safe if html.respond_to? :html_safe
    html
  end

end

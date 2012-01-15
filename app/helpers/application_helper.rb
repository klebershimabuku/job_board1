module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def description(page_description)
    content_for(:description) { page_description }
  end

  def keywords(page_keywords)
    content_for(:keywords) { page_keywords }
  end

  def logo
    link_to image_tag("logo.png", :title => "ShigotoDOKO", :class => "round"), root_path
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
    elsif user.admin?
    	content_tag(:strong, "That's you!")
    end
  end

  def verify_and_display_correct_changes_on_link(user)
    if user.announcer?
      link_to("Remove from announcer!", change_level_user_path(user), :class => 'btn')
    elsif user.admin?
    	"You are already a <strong>superuser</strong>".html_safe
    else
      link_to("Promote to announcer!", change_level_user_path(user), :class => 'btn')
    end
  end

  def my_simple_format(value)
    if value.nil?
      '-'
    else
      #value.gsub(/\n/, "<br /><br />").html_safe
      value.gsub(/<br><br>/, "<br />").html_safe
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
  
  def my_textilize(text)
  	raw RedCloth.new(text).to_html
  	#parser = HTMLToTextileParser.new
  	#parser.feed(text)
  	#parser.textile
  end

  def flash_message
      messages = ""
      [:notice, :info, :warning, :error, :alert].each {|type|
          if flash[type]
              messages += "#{flash[type]}"
          end
      }
      messages
  end


  def div_special(item)
   # check if the currently month is odd or even
   n = Time.now.strftime('%m').to_i
   even = (n%2 == 0) ? true : false
   if even
   	@highlight_class = 'highlight_even'
   else
   	@highlight_class = 'highlight_odd'
   end

   	if item.highlight 
  		@highlight_class += ' highlight_ad'
  	else
  		@highlight_class = ''
  	end 
    raw "<div class='#{@highlight_class}'>"
  end
  

  # usage: 
  #   link_to_next_page(@items)
  #   link_to_next_page(@items, :remote => true)  # Ajax
  def link_to_next_page(scope, name, options = {}, &block)
    param_name = options.delete(:param_name) || Kaminari.config.param_name
    link_to_unless scope.last_page?, name, {param_name => (scope.current_page + 1)}, options.merge(:rel => 'next') do
      block.call if block
    end
  end
  
  
end

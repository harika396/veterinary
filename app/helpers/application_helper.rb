module ApplicationHelper

  def nav_link text, link, icon={}
    icon = {
      size: "1x"
    }.merge(icon)

    content = link_to icon[:type].present? ? fa_icon(icon[:type].to_s, text: text, class: icon[:size].to_s) : text, link

    if current_page? link
      content_tag :li, class: "active" do
        content
      end
    else
      content_tag(:li) do
        content
      end
    end
  end

  def flash_class(level)
    case level
    when "notice" then "message-info"
    when "success" then "message-success"
    when "error" then "message-danger"
    when "alert" then "message-danger"
    end
  end

  def wrap_prepend_input_field(field, icon=nil, hint_text=nil)
    str = "<div class= 'input-group'><span class='input-group-addon'>"
    str << "<i class='#{icon}'></i></span>" unless icon.blank?
    str << field
    str << "</div>"
    str.html_safe
  end

  def wrap_input_field(field, label=nil, error_msg = "", hint_text=nil)
    class_name = (label != "") ? 'control-label' : 'label'
    str = "<div class='form-group'><label class='#{class_name}'>"
    str << label
    str << "</label> <div class='controls'>"
    str << field
    str << error_msg
    str << "</div></div>"
    str.html_safe
  end

  def wrap_input2_field(field, label=nil, error_msg = "", hint_text=nil)
    class_name = (label != "") ? 'control-label' : 'label'
    str = "<div class='form-group'><label class='#{class_name}'>"
    str << label
    str << "</label>"
    str << field
    str << error_msg
    str << "</div>"
    str.html_safe
  end


  def wrap_menu_link(link_text, icon_class=nil)
    "<i class='icon #{icon_class}'></i> <span>#{link_text}</span>".html_safe
  end

  def formatted_date(date)
  	date.to_date.strftime("%d/%m/%Y %I:%M:%S %p")
  end
  
end

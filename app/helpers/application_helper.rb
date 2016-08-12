module ApplicationHelper
  def full_title page_title = ""
    base_title = t "static_page.title"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def flash_class level
    case level
    when :notice then "alert-info"
    when :error then "alert-error"
    when :alert then "alert-warning"
    when :success then "alert-success"
    end
  end
end

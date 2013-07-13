module ApplicationHelper
  def link_to_category(cat)
    html_options = {}
    if current_page? cat
      html_options[:class] = 'active'
    end
    html_options[:title] = t('categories.link.title', default: "View all articles under #{cat.name.capitalize}")
    link_to cat.name.capitalize, cat, html_options
  end
end

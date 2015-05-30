module ApplicationHelper
  def rough_period_of_time_in_words(days)
    if days >= 7
      weeks = days / 7.0
      if weeks.round >= 4
        months = weeks / 4.0
        pluralize(months.round, 'month')
      else
        pluralize(weeks.round, 'week')
      end
    else
      pluralize(days, 'day')
    end
  end

  def current_account
    current_user.account
  end

  def nav_item(item, link)
    active = current_page?(link)
    item_html = h(item)
    item_html += ' '.html_safe + content_tag(:span, '(current)'.html_safe, class: 'sr-only') if active
    content_tag(:li, link_to(item_html, link), class: ('active' if active))
  end
end

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
end

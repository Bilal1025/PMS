module ApplicationHelper
  def titleize(title)
    title.to_s.humanize
  end

  def boolean_to_string(flag)
    flag ? 'Yes' : 'No'
  end
end

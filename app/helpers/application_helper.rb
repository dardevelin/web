module ApplicationHelper
  def title(title)
    if title.blank?
      "Codegram - Smart Web Apps"
    else
      "#{title} - Codegram"
    end
  end
end

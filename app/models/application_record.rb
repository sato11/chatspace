class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def sidebar_time
    if created_at.today?
      created_at.strftime('%T')
    elsif created_at > Time.now.ago(3.days)
      created_at.strftime('%A')
    else
      created_at.strftime('%F')
    end
  end
end

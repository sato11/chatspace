class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def sidebar_time
    c = created_at
    if c.today?
      c.strftime('%T')
    elsif c > Time.now.ago(3.days)
      c.strftime('%A')
    elsif c > Time.now.beginning_of_year
      c.strftime('%-m/%d')
    else
      c.strftime('%F')
    end
  end
end

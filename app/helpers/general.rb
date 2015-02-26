module General

  def self.this_month_name
    Date::MONTHNAMES[Date.today.month]
  end

  def self.last_month_name
    a = Date.today.month - 1
    if a < 1 then a = 12 end
    Date::MONTHNAMES[a]
  end

end

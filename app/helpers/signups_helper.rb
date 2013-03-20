module SignupsHelper
  def check_contacted(date_time)
    return "No" if !date_time
    I18n.localize date_time
  end
end

module TalksHelper
  def relative_date_if_this_week(time, now = Time.now, short: false)
    diff = now - time
    date = time.to_date
    today = now.to_date
    if date == today
      format = "%-H:%M"
    else
      if date == today.yesterday
        format = "昨日"
      elsif diff < 1.week
        format = "#{%w(日 月 火 水 木 金 土)[time.wday]}曜日"
      elsif diff < 1.year
        format = "%-m/%-d"
      else
        format = "%Y/%-m/%-d"
      end
      format << " %-H:%M" unless short
    end
    time.strftime(format)
  end
end

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

  def message_to_html(message)
    message = html_escape(message)
    message = make_url_link(message)
    message.gsub(/\R/, "<br />")
  end

  private

  def extract_url(text)
    unreserved_chars = '\w\-_.~'
    reserved_chars = '!$#&\'()*+,/:;=?@\[\]%'
    url_regex = %r!(?:https?|ftp)://[#{unreserved_chars}]+(?:/[#{unreserved_chars}#{reserved_chars}]*)*|mailto:[\w\!$#%&'*+\-/=?^_`{|}~.]+@[\w\-.]+!
    text.scan(url_regex)
  end

  def make_url_link(text)
    url_list = extract_url(text).uniq
    text.gsub(Regexp.union(url_list)) do |url|
      "<a href=\"#{url}\" target=\"_blank\">#{url}</a>"
    end
  end
end

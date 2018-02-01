module ApplicationHelper
  def trim_if_long(str, limit)
    return str if str.size <= limit
    str.slice(0, limit - 1) + "…"
  end
end

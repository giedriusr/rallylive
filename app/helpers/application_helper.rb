module ApplicationHelper
  def sidebar_link(url, link)
    url == link ? "class=active" : ''
  end

  def format_time(seconds)
    return '0:00.0' unless seconds.present?

    hours = 0
    minutes = 0
    seconds = seconds.to_f
    while (seconds >= 60) do
      seconds -= 60
      minutes += 1
      while(minutes >= 60) do
        minutes -= 60
        hours += 1
      end
    end

    seconds = seconds.round(1)
    seconds_with_zero = seconds
    seconds_with_zero = '0' + seconds.to_s if seconds < 10
    minutes_with_zero = minutes
    minutes_with_zero = '0' + minutes.to_s if minutes < 10

    return "#{hours}:#{minutes_with_zero}:#{seconds_with_zero}" if hours.to_i > 0
    return "#{minutes}:#{seconds_with_zero}" if minutes.to_i > 0
    return "#{seconds}"
  end
end

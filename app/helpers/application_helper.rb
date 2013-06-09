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

  def average_speed(time, length)
    return '-' if time == 0 || time.nil?
    return '-' if length.nil?
    (length / time.to_f * 3600).round(2)
  end

  def classifications
    ['SG-2', 'SG-1', '2WD', 'R4/2', 'L8/3', 'WRC/1', 'N4/2', 'L9', 'L8/3', 'A7/4', '5', 'L9/7', 'L7/6', 'SG/8', 'SG-3']
  end
end

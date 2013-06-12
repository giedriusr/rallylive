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

  def penalty_time(seconds)
    seconds = seconds.to_i
    return '0.0' if !seconds.present? || seconds == 0
    if seconds < 60
      "0:" + seconds.to_s
    else
      time = format_time(seconds)
      if seconds < 600 # less than 10 minutes
        time[0, 4]
      elsif seconds < 3600
        time[0, 5]
      else
        time[0, 7]
      end
    end
  end

  def average_speed(time, length)
    return '-' if time == 0 || time.nil?
    return '-' if length.nil?
    (length / time.to_f * 3600).round(2)
  end

  def classifications
    ['WRC/1', 'N4/2', 'R4/2', 'L8/3', 'A7/4', '5', 'L7/6', 'L9', 'L9/7', 'SG/8', 'SG-1', 'SG-2', 'SG-3', '2WD']
  end

  def time_types
    { 'Po GR' => 0, 'GR' => 1 }
  end

  def full_team(participant)
    raw("#{participant.driver_name}<br>#{participant.co_driver_name}<br><u>#{participant.team_name}</u>")
  end
end

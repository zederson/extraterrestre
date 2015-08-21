module ApplicationHelper
  LIST_CLASS = %w(list-primary list-success list-danger list-warning list-info list-inverse)

  def list_class_random
    LIST_CLASS.sample
  end

  def device_type_icon(type)
    type == Device::IN ? 'fa-sign-in' : 'fa-hand-o-up'
  end

  def print_weather_icon(icon)
    hour = Time.now.hour
    prefix = ''
    prefix = 'nt_' if (hour > 18 || hour < 6)
    ic = "#{prefix}#{icon}"
    image_tag("http://icons.wxug.com/i/c/k/#{ic}.gif", size: "35x35")
  end

  def icon_sensor_light_name(value)
    value ? 'fa-info-circle' : 'fa-check-circle'
  end
end

module BenderHelper

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

  def on_off_socket(value, id)
    clazz = value ? 'label-success' : 'label-danger'
    classes = ['label', clazz]
    content_tag :h6, class: classes, id: "socket_content_#{id}" do
      I18n.t "bender.status_#{value}"
    end
  end
end

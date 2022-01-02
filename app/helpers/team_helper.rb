module TeamHelper
  def attribute_color value
    case value
    when 1..50
      'red'
    when 50..60
      'orange'
    when 60..70
      'amber'
    when 70..80
      'yellow'
    when 80..85
      'lime'
    else
      'green'
    end
  end
end


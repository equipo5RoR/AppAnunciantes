require 'ostruct'
require 'base64'
require 'cgi'

class ScriptLogo

  def initialize options
    @options = options
  end

  def generate
    # Defining Colors
    colors = ["#1abc9c", "#16a085", "#f1c40f", "#f39c12", "#2ecc71", "#27ae60", "#e67e22",
    "#d35400", "#3498db", "#2980b9", "#e74c3c", "#c0392b", "#9b59b6", "#8e44ad", "#bdc3c7",
    "#34495e", "#2c3e50", "#95a5a6", "#7f8c8d", "#ec87bf", "#d870ad", "#f69785", "#9ba37e",
    "#b49255", "#b49255", "#a94136"]

    settings = OpenStruct.new({
        name: 'Name',
        seed: 0,
        charCount: 1,
        textColor: '#ffffff',
        height: 100,
        width: 100,
        fontSize: 60,
        fontWeight: 400,
        fontFamily: 'HelveticaNeue-Light,Helvetica Neue Light,Helvetica Neue,Helvetica, Arial,Lucida Grande, sans-serif',
        radius: 0
    }.merge(@options))

    # making the text object
    c = settings.name[0..(settings.charCount - 1)].upcase
    attributes = {
        'y': '50%',
        'x': '50%',
        'dy': '0.35em',
        'pointer-events': 'auto',
        'fill': settings.textColor,
        'font-family': settings.fontFamily,
        'text-anchor': 'middle',
        style: "font-weight: #{settings.fontWeight}; font-size: #{settings.fontSize}px;"
    }
    cobj = "<text #{attributes.map{|key, value| "#{key}='#{value}'" }.join(" ")}>#{c}</text>"

    colorIndex = ((c[0].ord + settings.seed) % colors.size).floor

    css = {
        'background-color': colors[colorIndex],
        'width': settings.width.to_s+'px',
        'height': settings.height.to_s+'px',
        'border-radius': settings.radius.to_s+'px',
        '-moz-border-radius': settings.radius.to_s+'px'
    }

    attributes = {
        'xmlns': 'http://www.w3.org/2000/svg',
        'pointer-events': 'none',
        'width': settings.width,
        'height': settings.height,
        style: css.map{|key, value| "#{key}: #{value};"}.join(" ")
    }

    svg = "<svg #{attributes.map{|key, value| "#{key}='#{value}'" }.join(" ")}>#{cobj}</svg>"

    svgHtml = (CGI.unescape(CGI.escape(svg)))
    svgHtml
  end
end
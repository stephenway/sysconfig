#!/usr/bin/env ruby
#
# This script is an astonishing feat of top notch
# rockstar craftsmanship. It totally uses artificial
# intelligence to extract colors out of tmTheme and
# build an itermcolors scheme file for iTerm2.
#
# I know this sounds crazy, but it actually knows
# approximately what colors should be used in the
# ANSI list, and tries to find nearest colors from
# the given tmTheme. This level of intelligent guessing
# has never been achieved before in the field of
# converting TextMate themes into iTerm color schemes.
# Never.
#
#
# USAGE
#
# Step 1. Make sure you have plist gem installed
#   gem install plist
#
# Step 2. Make it executable
#   chmod +x tm2iterm.rb
#
# Step 3. Execute it
#   ./tm2iterm.rb /path/to/some.tmTheme /path/to/output.itermcolors
#
# Step 4. Double click the itermcolors file
#   iTerm2 will pick up the scheme and add it to the list

require 'rubygems'
require 'plist'

BRIGHTEN_AMOUNT = 50

class Color
  attr_reader :hex, :rgb, :coefficients, :coef_hash

  def initialize(hex = nil)
    hex ||= '000000'

    if hex =~ /\A#/
      hex.slice!(0)
    end

    @hex = hex[0..5]

    @rgb = @hex.scan(/../).map do |hex_component|
      cap_between_0_and_255(hex_component.to_i(16))
    end

    @coefficients = @rgb.map do |value|
      value / 255.0
    end

    @coef_hash = {
      'Red Component'   => @coefficients[0],
      'Green Component' => @coefficients[1],
      'Blue Component'  => @coefficients[2]
    }
  end

  def brighten(value = BRIGHTEN_AMOUNT)
    hex_string = @rgb.map do |component|
      cap_between_0_and_255(component + value).to_s(16)
    end.join

    self.class.new(hex_string)
  end

  alias to_s hex

  def inspect
    "<Color:##{self}>"
  end

  def sum_distance(color)
    [0, 1, 2].map{ |i| (color.rgb[i] - rgb[i]).abs }.inject(0){ |sum, v| sum += v }
  end

  def find_nearest(colors)
    colors.min do |a, b|
      sum_distance(a) <=> sum_distance(b)
    end
  end

  def ==(color)
    color.rgb == rgb
  end

  private
  def cap_between_0_and_255(num)
    num = [num, 0].max
    num = [num, 255].min
    num
  end
end

# Shortcut
def c(hex)
  Color.new(hex)
end

input, output = ARGV
if input.nil? || output.nil?
  puts 'FAIL. OMG.'
  puts 'Usage: tm2iterm /path/to/file.tmTheme /path/to/file.itermcolors'
  exit(1)
end

tm_theme = Plist::parse_xml(input)

head = tm_theme['settings'].shift['settings']
tail = Hash[tm_theme['settings'].map do |s|
  [ s['name'].downcase, s['settings']['foreground'] ]
end]

background    = c head['background']
bold          = c head['foreground']
cursor        = c head['caret']
cursor_text   = c head['foreground']
foreground    = c head['foreground']
selected_text = c head['foreground']
selection     = c head['selection']

# black   #000000
# red     #ff0000
# green   #00ff00
# yellow  #ffff00
# blue    #0000ff
# magenta #ff00ff
# cyan    #00ffff
# white   #ffffff

ref_color_list = %w[ #000000
                     #ff0000
                     #00ff00
                     #ffff00
                     #0000ff
                     #ff00ff
                     #00ffff
                     #ffffff ].map{ |color| c(color) }

src_color_list = tail.values.uniq.map{ |color| c(color) }

ansi = []

8.times do |i|
  if matching_color = src_color_list.find{|color| color == ref_color_list[i]}
    ansi[i] = matching_color
    src_color_list.delete(matching_color)
  end
end

8.times do |i|
  ansi[i] = ansi[i] || begin
    nearest = ref_color_list[i].find_nearest(src_color_list)
    src_color_list.delete(nearest)
    nearest
  end
end


8.times do |i|
  ansi[i + 8]  = ansi[i].brighten
end

scheme = {
  'Background Color'    => background.coef_hash,
  'Bold Color'          => bold.coef_hash,
  'Cursor Color'        => cursor.coef_hash,
  'Cursor Text Color'   => cursor_text.coef_hash,
  'Foreground Color'    => foreground.coef_hash,
  'Selected Text Color' => selected_text.coef_hash,
  'Selection Color'     => selection.coef_hash,
}

16.times do |i|
  scheme.merge!("Ansi #{i} Color" => ansi[i].coef_hash)
end

File.open(output, 'w') do |file|
  file.write(Plist::Emit.dump(scheme))
end

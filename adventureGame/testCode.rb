require 'squib'

data = Squib.csv file: 'data.csv' # no artwork data in our game data!!
layouts = ['layout2.yml']

Squib::Deck.new cards: data['name'].size, layout: layouts do
  background color: 'white'
  svg file: data['name'].map { |t| "#{t.downcase}.svg"},  # method 2
      layout: 'art'
  svg file: data['terrain'].map { |t| "#{t.downcase}.svg"},  # method 2
      layout: 'banner'
  svg file: data['continent'].map { |t| "#{t.downcase}.svg"},  # method 2
      layout: 'continent'
  svg file: data['cost'].map { |t| "cost#{t}.svg"},  # method 2
      layout: 'cost'
  svg file: data['prestige'].map { |t| "prestige#{t}.svg"},  # method 2
      layout: 'prestige'
  rect layout: 'cut'
  rect layout: 'safe'
  text str: data['name'], layout: 'title', font: 'Libre Baskerville, Bold', color: :textColor, stroke_color: :strokeColor, stroke_width: 3
  text str: data['description'], layout: 'description', font: 'Daniel Black', color: :strokeColor
  #text str: Time.now, layout: 'credits'
  svg layout: data['faction']
  save_sheet prefix: 'testCards', columns: 4
  save_pdf trim: 37.5
end
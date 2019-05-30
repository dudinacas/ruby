# based on lol-helper by yandasilva

[ # requires all of these gems
  'oga',
  'hpricot',
  'excon',
  'colorize'
].each(&method(:require))

def get_champ_data(champ, pos)

  # Requests champion.gg page of desired champion
  raw_data = Excon.get('http://www.champion.gg/champion/' + champ).to_s
  info = Oga.parse_html(raw_data)

  #Extracts and prints champion name from page_soup
  elements = info.search("//div[@class='col-xs-12 col-sm-3 col-md-2 champion-profiles']") # change to oga
  # champion =  elements.xpath('h1')
  # puts "Your champion: #{champion}".red
  puts elements

end

get_champ_data('skarner', 'jungle')

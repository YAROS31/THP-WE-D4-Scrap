
require 'nokogiri'
require 'open-uri'

def method 
# Ouvrir l'URL souhaitée sous Nokogiri et le stocker dans un objet page #
page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
# Extraire les éléments HTML que tu veux scrapper en utilisant leur XPath et en les stockant dans un array #
# X.path du BTC : //*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[3]/div #
# //*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[3] #

# Mettre les symb dans un array en utilisant l'inspecteur et * puis je les push dans un tableau#
array_symb = []
crypto_symb_array = page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/*/td[3]/div')
crypto_symb_array.each do |symb|
array_symb << symb.text

end
print array_symb
puts " "
puts " "

# Mettre les noms dans un array en utilisant la class puis je les push dans un tableau#
array_name = []
crypto_name_array = page.xpath('//*[@class="cmc-table__column-name--name cmc-link"]')
crypto_name_array.each do |name|
  array_name << name.text
end
print array_name
puts " "
puts " "

# Mettre les prix dans un array en utilisant l'inspecteur #
array_value = []
crypto_values_array = page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/*/td[5]/div/a/span')
crypto_values_array.each do |value|
  array_value << value.text.delete("$,").to_f
end
print array_value
puts " "
puts " "


# Tout mettre dans un hash #
#result = Hash.new
#puts "mes hashs : "
#array_symb.count do |i| 
  #result = {array_symb[i] => array_value[i]}
#end
#print result[array_symb] = array_value
puts " "
puts " "

puts h = array_symb.zip(array_value).to_h
end

method


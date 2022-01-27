require 'nokogiri'
require 'open-uri'

def get_avernes_email
  page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/95/avernes.html"))
  avernes_email_array = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
puts avernes_email_array
end
get_avernes_email

def get_town
  cities_array_def = []
  page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
  cities_array = page.xpath('//*[@class="lientxt"]')
  cities_array.each do |town|
    cities_array_def << town.text
  end
  print cities_array_def
  puts " "
end
get_town
puts " "


def get_all_url
  all_urls = []
  page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
  url_array = page.xpath('//*[@class="lientxt"]/@href')
  url_array.each do |url|
    all_urls << "https://www.annuaire-des-mairies.com#{url.text[1..-1]}" #permet de supprimer le premier caractère
  end
  puts "tableau des urls :"
  print all_urls
  puts " "
end
get_all_url


def perform(url)
  all_emails = []
  for i in 0..179
  page = Nokogiri::HTML(open("#{url[i]}"))
   # rescue
   begin
    # Put each email in an array "ville_email_array"
    all_emails << page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text 
     rescue => e
     all_emails << " "
     end
  end

  puts "perform :"
  puts all_emails
  puts " "

end
perform(get_all_url)
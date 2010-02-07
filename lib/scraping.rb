require 'rubygems'
require 'net/http'
require 'hpricot'
require 'cgi'
require 'open-uri'
require 'uri'

module Scraping
  
  METACRITIC_URL = "http://www.metacritic.com"
  BASE_URL = "http://www.metacritic.com/video/alpha/"
  PAGES = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','qr','s','t','u','v','w','xyz','0123456789']
  DATA_NAMES = ["score", "url"]
  
  def self.scrape
    for page in PAGES
      url = BASE_URL + page
      doc = Hpricot(open(url))
      films_doc = doc.search("//table[@class='index']")

      for film_doc in films_doc.search("//tr")
        datums_doc = film_doc.search("//td") 
        url = datums_doc[0].at('a')['href']
        title = datums_doc[0].at('a').inner_html()
        score = datums_doc[2].at('span').inner_html()

        Film.get_or_create(title, url, score).save()
      end
    end
  end
end
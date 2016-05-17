class Web < ActiveRecord::Base
    require 'rubygems'
    require 'httparty'
    require 'nokogiri'
    require 'json'
    require 'pry'
    require 'csv'
    require 'open-uri'
    require 'uri'
    require 'htmlentities'


  def self.web_scrapper
    for page in 1..89
      url = "http://www.drugtodayonline.com/drug-directory/pharmacological-index/page#{page}.html"
      doc = Nokogiri::HTML(open(url))
      doc.css('#listings').css('.listing-summary').each do |list|
        obj = {}
        obj["Name"] = list.css('.header').css('h3').text
        obj["Address"] = list.css('.address').text
        list.css('.fieldRow').each do |fieldRow|
          if fieldRow.css('.caption').text == "E-mail"
            unless fieldRow.css('.output').text.nil?
              obj["E-mail"] = HTMLEntities.new.decode(fieldRow.css('.output').text.gsub!(/\&#[^<]++/).first)
              puts obj["E-mail"]
            end
          else
            obj[fieldRow.css('.caption').text] = fieldRow.css('.output').text
            puts fieldRow.css('.caption').text
          end
        end

        #decode = URI.decode("E-mail")

        Web.create(address: obj["Address"], name: obj["Name"], phone: obj["Telephone"], fax: obj["Fax"], email: URI.decode(obj["E-mail"].to_s))
        puts "sumit"
      end
    end
  end


   def self.csv
      CSV.open('medicines.csv', 'w+') do |csv|
        csv << column_names
        Web.all.each do |product|
          csv << product.attributes.values_at(*column_names)
        end
      end
    end
end

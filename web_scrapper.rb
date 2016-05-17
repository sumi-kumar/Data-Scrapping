	require 'rubygems'
	require 'httparty'
    require 'nokogiri'
    require 'json'
    require 'pry'
    require 'csv'



	  page = HTTParty.get('http://www.drugtodayonline.com/drug-directory/pharmacological-index.html')
	  parse_page = Nokogiri::HTML(page)
	  Pry.start(binding)
 # #      medicines_array = []
 # # 	  medicine_name = a.text
	# #  # 	medicines_array.push(medicine_name)

	# #  # end
	# #  # Pry.start(binding)


	# # # CSV.open('medicines_csv', 'w') do |csv|
	# # # 	csv << medicines_array
	# # # end

	# # # Pry.start(binding)

	# # parse_page.css('#listings').css('.listing-summary').css('.address').text
 # #    parse_page.css('#listings').css('.listing-summary').css('.header').css('h3').text




	#  def web_scrapper
	#  	for page in 1..89
	# 		url = HTTParty.get("http://www.drugtodayonline.com/drug-directory/pharmacological-index/page=#{page}.html")
	# 		doc = Nokogiri::HTML(open(url))
	# 		 for k in 0..20
	# 			address = doc.css('#listings').css('.listing-summary').css('.header').css('h3').text
	# 			name = doc.css('#listings').css('.listing-summary').css('.address').text
	# 			# Web.create(address:address, name:name)
	# 			puts "sumit"
	# 		end
	# 	end
	# end


	 # def csv
	 #    CSV.open('medicines.csv', 'w+') do |csv|
	 #      csv << column_names
	 #      all.each do |product|
	 #        csv << product.attributes.values_at(*column_names)
	 #      end
  #       end
  #    end


        # for page in 1..89
			url = HTTParty.get("http://www.drugtodayonline.com/drug-directory/pharmacological-index/page5.html")
			doc = Nokogiri::HTML(url)
			Pry.start(binding)
			# medicines_array = []
			# address = doc.css('#listings').css('.listing-summary').css('.header').css('h3').text
 		# 	name = doc.css('#listings').css('.listing-summary').css('.address').text
 		# 	doc.css('#listings').css('.listing-summary').css('.header').css('h3').map do |a|
 		# 		name = a.text
 		# 		medicines_array.push(name)
 		# 	end
 		# end


	 # 	CSV.open('medicines_csv', 'w') do |csv|
		# 	csv << medicines_array
		# end



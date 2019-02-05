class WelcomeController < ApplicationController

  def home
  	@potins = Potin.all.reverse
  	puts '#' *30
  	p params
  	puts '#' *30
  	unless params[:blase].nil?
  		User.create(first_name: params[:blase], city: City.all.sample)
    end

    unless params[:Potin_title].nil? && params[:Potin_text].nil?
    	Potin.create(title: params[:Potin_title], content: params[:Potin_text], user: User.last, date: Time.now.to_date)
   	end
  end

  def askname
  end

end

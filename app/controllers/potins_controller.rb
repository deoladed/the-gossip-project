class PotinsController < ApplicationController
  def show
  	@potins = Potin.all
  	@name = 'toi'
  	puts '#' *30
  	puts params
  	puts params[:id]
  	puts '#' *30
  end

  def user
  	@potins = Potin.all
  	@name = 'toi'
  end
end

class PotinsController < ApplicationController
  def show
  	@potins = Potin.all
  	puts '#' *30
  	puts params
  	puts params[:id]
  	puts '#' *30
    @name = 'toi'
  end

  def user
  	@potins = Potin.all
    @name = 'toi'
  end

  def create
    @name = 'toi'
  end
end

class SearchesController < ApplicationController

  def search
    @search = Search.new(params)
  end

end

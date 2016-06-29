class SearchesController < ApplicationController

  def search
    @search = Search.new(params)

    if @search.results.empty?
      render :no_songs_message
    else
      render :search_results
    end
  end

end

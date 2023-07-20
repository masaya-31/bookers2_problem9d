class TagSearchesController < ApplicationController
  def search
    @word = params[:word]
    @books = Book.where("tag LIKE?","%#{@word}%")
    render "tag_searches/search"
  end
end

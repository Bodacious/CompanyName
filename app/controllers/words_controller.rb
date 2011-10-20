class WordsController < ApplicationController
  
  expose(:words) { Word.to_consider.page(params[:page]).per(100) }
  expose(:word)
  
  def index
  end

  def destroy
    respond_to do |format|
      format.js{
        word.update_attribute(:shortlist, false)        
      }
    end
  end

end

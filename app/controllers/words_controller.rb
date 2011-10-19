class WordsController < ApplicationController
  
  expose(:words) { Word.domain_available }
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

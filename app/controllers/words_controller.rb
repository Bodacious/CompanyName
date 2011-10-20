class WordsController < ApplicationController

  expose(:flagged_words) { Word.flagged }
  expose(:words) { Word.to_consider.page(params[:page]).per(100) }
  expose(:word) { Word.find(params[:id])}
  
  def index
  end

  def destroy
    respond_to do |format|
      format.js{
        word.update_attribute(:shortlist, false)        
      }
    end
  end
  
  def flag
    respond_to do |format|
      format.js{
        word.update_attribute(:flag_for_purchase, true)        
      }
    end
  end
  
  def unflag
    respond_to do |format|
      format.js{
        word.update_attribute(:flag_for_purchase, false)        
      }
    end
  end

end

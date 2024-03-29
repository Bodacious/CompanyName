class Word < ActiveRecord::Base

  scope :domain_available, where(:domain_available => true)
  scope :domain_unchecked, where(:domain_available => nil)
  scope :domain_unavailable, where(:domain_available => false)  
  
  scope :shortlisted, where(:shortlist => true)
  scope :unchecked, where(:shortlist => nil)
  scope :rejected, where(:shortlist => false)  
  
  scope :to_consider, domain_available.
    where("(shortlist IS NULL OR shortlist = ?) AND (flag_for_purchase = ? OR flag_for_purchase is null)", true, false)
  
  scope :flagged, where(flag_for_purchase: true)
  
  validates :computer, presence: true, uniqueness: true
  validates :human, presence: true, uniqueness: true
  
  def domain
    "#{computer}.com".downcase
  end
  
end

namespace :domains do
  desc "Check all"
  task :check_all => :environment do
    Word.domain_unchecked.find_each do |word|
      available             = Whois.whois("#{word.computer}.com").available?
      word.domain_available = true
      word.shortlist        = true
      word.save if available
    end
  end
end
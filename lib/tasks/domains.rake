namespace :domains do
  desc "Check all"
  task :check_all => :environment do
    Word.domain_unchecked.order('computer').find_each do |word|
      puts word.human
      available             = begin Whois.whois("#{word.computer}.com").available? rescue next end
      word.domain_available = available
      word.shortlist        = available
      word.save
    end
  end
end
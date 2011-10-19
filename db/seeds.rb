Dir.glob(Rails.root.join("word_files", "*")) do |file|
  File.read(file).each_line do |word|
    word = word.gsub(/\r\n/, "").gsub(/\'s/, "")
    print "*"
    Word.create human: word.singularize, computer: word.singularize
    Word.create human: word.pluralize, computer: word.pluralize
  end  
end

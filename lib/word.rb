class Word

  @@words = []

  def Word.create(word, language)
    test_word = Word.new(word, language)
    test_word.save
    test_word
  end

  def save
    @@words << self
  end

  def initialize(word, language)
    @word = word
    @language = language
  end

  def word
    @word
  end

  def Word.all
    @@words
  end

  def Word.clear
    @@words = []
  end

end


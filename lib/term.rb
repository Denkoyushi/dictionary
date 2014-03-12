class Term

  @@terms = []

  def Term.create(word, definition)
    test_term = Term.new(word, definition)
    test_term.save
    test_term
  end

  def Term.search(user_input)
    Term.all.each_with_index do |term, index|
      if term.words == user_input
        return Term.all[index].full_term
      end
    end
  end

  def Term.all
    @@terms
  end

  def save
    @@terms << self
  end

  def words
    @word
  end

  def definitions
    @definition
  end

  def full_term
    @word.to_s + " " + @definition.to_s
  end

  def edit_term(word, definition)
    @word = word.split
    @definition = definition.split

  end



  def initialize(word, definition)
    # @word = word
    @word = []
    # @definition = definition
    @definition = []
    # add_word(word)
    # add_definition(definition)
  end

  def Term.clear
    @@terms = []
  end
end


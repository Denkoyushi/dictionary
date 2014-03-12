class Definition

  @@definitions = []

  def Definition.create(definition, language)
    test_definition = Definition.new(definition, language)
    test_definition.save
    test_definition
  end

  def save
    @@definitions << self
  end

  def initialize(definition, language)
    @definition = definition
    @language = language
  end

  def Definition.all
    @@definitions
  end

  def Definition.clear
    @@definitions = []
  end

end

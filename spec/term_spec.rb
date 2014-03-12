require 'rspec'
require 'term'
require 'word'
require 'definition'

describe Term do
  before { Term.clear }

  it 'initializes with the word and definition' do
    test_term = Term.new("apple", "food")
    test_term.should be_an_instance_of Term
  end
  it 'should put all instances in a class array' do
    test_term = Term.create("apple", "food")
    Term.all.should eq [test_term]
  end
  describe 'search' do
    it 'should seach through the term array and return the full term' do
      test_term = Term.create("apple", "food")
      Term.search("apple").should eq [test_term]
    end
  end
end

describe Word do
  before { Word.clear }
  it 'creates the object' do
    test_term = Word.create("apple", "english")
    test_term.should be_an_instance_of Word
  end
  it 'should put all instances in a class array' do
    test_word = Word.create("apple", "english")
    Word.all.should eq [test_word]
  end
end

describe Word do
  before { Word.clear }
  it 'creates the object' do
    test_term = Word.create("apple", "english")
    test_term.should be_an_instance_of Word
  end
  it 'should put all instances in a class array' do
    test_word = Word.create("apple", "english")
    Word.all.should eq [test_word]
  end
end

describe Definition do
  before { Definition.clear }
  it 'creates the object' do
    test_def = Definition.create("apple", "english")
    test_def.should be_an_instance_of Definition
  end
  it 'should put all instances in a class array' do
    test_def = Definition.create("apple", "english")
    Definition.all.should eq [test_def]
  end
end

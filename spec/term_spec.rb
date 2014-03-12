require 'rspec'
require 'term'

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

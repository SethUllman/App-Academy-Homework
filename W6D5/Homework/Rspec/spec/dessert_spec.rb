require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :name => "Emmy")}
  let(:brownie) {Dessert.new('dessert', 10, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("dessert")
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{Dessert.new('dessert', 'quantity', chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      brownie.ingredients << "chocolet"
      expect(brownie.ingredients).to_not be_empty
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      brownie.ingredients.concat(['chocolet', 'mix', 'chips', 'gruul'])
      brownie.mix!
      expect(brownie.ingredients).to_not eq(['chocolet', 'mix', 'chips', 'gruul'])

    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      brownie.eat(10)
      expect(brownie.quantity).to eq(0)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect{brownie.eat(11)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Emmy the Great Baker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).with brownie
    end
  end
end

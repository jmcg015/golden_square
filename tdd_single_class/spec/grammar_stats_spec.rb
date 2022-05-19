require "grammar_stats"

RSpec.describe GrammarStats do
  describe "@check" do
    context "with a string passed as an argument" do
      it "returns true if string present" do
        grammar_stats = GrammarStats.new
        text = grammar_stats.check("Hello!")
        expect(text).to eq true
      end

      it "returns true if string starts with capital letter" do
        grammar_stats = GrammarStats.new
        text = grammar_stats.check("Hello!")
        expect(text).to eq true
      end

      it "returns true if string ends with correct punctuation" do
        grammar_stats = GrammarStats.new
        text = grammar_stats.check("Hello!")
        expect(text).to eq true
      end
    end
  end

  describe "percentage_good" do
    context "Returns the percentage as an integer" do
      it "returns an integer" do
        grammar_stats = GrammarStats.new
        grammar_stats.check("Hello!")
        grammar_stats.check("hello")
        result = grammar_stats.percentage_good
        expect(result).to eq 50
      end

      it "returns a percentage of passed tests as an integer" do
        grammar_stats = GrammarStats.new
        grammar_stats.check("Hello!")
        grammar_stats.check("Hello!")
        grammar_stats.check("hello")
        result = grammar_stats.percentage_good
        expect(result).to eq 66
      end
    end
  end
end

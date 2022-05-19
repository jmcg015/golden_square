require "check_codeword.rb"

RSpec.describe "check_codeword method" do
  it "returns 'Correct! Come in.' if codeword is 'horse" do
    codeword = check_codeword("horse")
    expect(codeword).to eq "Correct! Come in."
  end

  it "returns 'Close, but nope.' if codeword first letter is h and last letter is e" do
    codeword = check_codeword("harambe")
    expect(codeword).to eq "Close, but nope."
  end

  it "returns 'WRONG!' if codeword is anything else" do
    codeword = check_codeword("jam")
    expect(codeword).to eq "WRONG!"
  end
end

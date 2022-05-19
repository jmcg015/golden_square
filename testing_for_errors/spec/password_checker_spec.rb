require "password_checker"

RSpec.describe PasswordChecker do
  it "returns true for passwords with 8+ characters" do
    password_checker = PasswordChecker.new
    expect(password_checker.check("password")).to eq true
  end

  it "fails if password is less than 8 characters" do
    password_checker = PasswordChecker.new
    expect { password_checker.check("appple") }.to raise_error "Invalid password, must be 8+ characters."
  end
end

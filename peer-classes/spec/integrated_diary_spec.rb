require "diary"
require "secret_diary"

RSpec.describe "integration" do
  context "initially" do
    it "returns 'go away' and the diary is locked" do
      diary = Diary.new("Here's a secret")
      secret_diary = SecretDiary.new(diary)
      expect { secret_diary.read }.to raise_error "Go away!"
    end
  end

  it "returns the contents of the diary if it is unlocked" do
    diary = Diary.new("Here's a secret")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq "Here's a secret"
  end

  context "diary locking behaviour" do
    it "if locked, diary can be unlocked" do
      diary = Diary.new("Here's a secret")
      secret_diary = SecretDiary.new(diary)
      expect(secret_diary.unlock).to eq true
    end

    it "can be locked if diary is unlocked" do
      diary = Diary.new("Here's a secret")
      secret_diary = SecretDiary.new(diary)
      expect(secret_diary.lock).to eq false
    end
  end
end

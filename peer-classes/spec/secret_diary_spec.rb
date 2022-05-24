require "secret_diary"

RSpec.describe SecretDiary do
  context "initially" do
    it "returns 'go away' and the diary is locked" do
      diary = double :diary, contents: "Here's a secret"
      secret_diary = SecretDiary.new(diary)
      expect { secret_diary.read }.to raise_error "Go away!"
    end
  end

  context "diary locking behaviour" do
    it "if locked, diary can be unlocked" do
      diary = double :diary, contents: "Here's a secret"
      secret_diary = SecretDiary.new(diary)
      expect(secret_diary.unlock).to eq true
    end

    it "can be locked if diary is unlocked" do
      diary = double :diary, contents: "Here's a secret"
      secret_diary = SecretDiary.new(diary)
      expect(secret_diary.lock).to eq false
    end
  end

  it "can read diary contents if unlocked" do
    diary = double :diary, contents: "Here's a secret"
    expect(diary).to receive(:read).and_return "Here's a secret"
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq "Here's a secret"
  end
end

class SecretDiary
  def initialize(diary)
    @diary = diary
    @unlocked = false
  end

  def read
    fail "Go away!" if !@unlocked
    return @diary.read
    # Raises the error "Go away!" if the diary is locked
    # Returns the diary's contents if the diary is unlocked
    # The diary starts off locked
  end

  def lock
    @unlocked = false
  end

  def unlock
    @unlocked = true
  end
end

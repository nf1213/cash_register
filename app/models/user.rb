module User
  def encrypt_password
    if password.present?
      if self.salt.nil?
        self.salt = BCrypt::Engine.generate_salt
      end
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def match_password(login_password="")
    encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end

  def clear_password
    self.password = nil
  end
end

unless User.exists?
  User.create(email: 'cwise@murmurinformatics.com', password: 'nutmeg', password_confirmation: 'nutmeg')
end
class AccountCreation < ActionMailer::Base
  default from: "postmaster@casecycling.com"

  def newAccount(email, name, creation_hex)
  	@name = name
  	@email = email
  	@creation_hex = creation_hex
  	mail(:to => email, 
  		:subject => "Your Case Cycling Account Needs to Be Confirmed", 
  		:reply_to => "noreply@casecycling.com")
  end
end

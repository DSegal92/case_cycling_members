class AccountCreation < ActionMailer::Base
  default from: "postmaster@casecycling.com"

  def newAccount(email, name, creation_hex)
  	@name = name
  	@email = email
  	@creation_hex = creation_hex
  	mail(:to => "dls148@case.edu", 
  		:subject => "Your Case Cycling Account Needs to Be Confirmed", 
  		:reply_to => "noreply@casecycling.com")
  end

  def newUser(email, name, id)
  	@name = name
  	@email = email
  	@id = id
  	mail(:to => "contactcasecycling@gmail.com", :subject => "[NOTICE] New User Account - " + @name )
  end

  def confirmedAccount(email, name)
    @name = name
    @email = email
    mail(:to => "dls148@case.edu",
          :subject => "Your Case Cycling Account is Now Active",
          :reply_to => "noreply@casecycling.com")
  end
end
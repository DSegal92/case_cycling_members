ActionMailer::Base.smtp_settings = {
	:address				=> "smtp.mailgun.org",
	:port					=> "587",
	:domain					=> "casecycling.com",
	:user_name				=> "postmaster@casecycling.com",
	:password				=> ENV['MAILGUN_PASSWORD'],
	:authentication 		=> "plain"
}


ActionMailer::Base.delivery_method = :smtp
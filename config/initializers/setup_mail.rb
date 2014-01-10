ActionMailer::Base.smtp_settings = {
	:address				=> "smtp.mailgun.org",
	:port					=> "587",
	:domain					=> "casecycling.com",
	:user_name				=> "ppostmaster@casecycling.com",
	:password				=> "0obs-jnzjg02",
	:authentication 		=> "plain"
}


ActionMailer::Base.delivery_method = :smtp
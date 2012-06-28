class UserMailer < ActionMailer::Base
  default from: "admin@findata.herokuapp.com"

  def investments_email(user)
    @user = user
    @url  = "http://findata.herokuapp.com"
    mail(:to => user.email, :subject => "Investment Details for @user")
    @current_controller  = "usermailer"
  end

end

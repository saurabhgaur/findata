class UserMailer < ActionMailer::Base
  default from: "admin@findata.herokuapp.com"

  def investments_email(user,notifyee)
    @user = user
    @url  = "http://findata.herokuapp.com"
    content_type = "text/html"
    mail(:to => notifyee.email_id, :subject => "Investment Details for "+@user.name)
    current_controller  = "usermailer"
  end

end

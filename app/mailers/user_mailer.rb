class UserMailer < ActionMailer::Base
  default from: "admin@findata.herokuapp.com"

  def investments_email(user,notifyee)
    @user = user
    @url  = "http://findata.herokuapp.com"
    content_type = "text/html"
    if @user.name
    	mail(:to => notifyee.email_id, :subject => "Investment Details for " + @user.name)
    else
    	mail(:to => notifyee.email_id, :subject => "Investment Details")
    end
    current_controller  = "usermailer"
  end

end

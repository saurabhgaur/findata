class UserMailer < ActionMailer::Base
  default from: "admin@findata.herokuapp.com"

  def investments_email(user)
    @user = user
    @url  = "http://findata.herokuapp.com"
    content_type = "text/html"
    @user.family_members.each do |family_member|
    	if family_member.notify?
    		mail(:to => family_member.email_id, :subject => "Investment Details for @user")
    	end
    end	
    current_controller  = "usermailer"
  end

end

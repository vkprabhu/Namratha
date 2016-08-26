class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.new_comment.subject
  #
  def new_comment(profile,usr)
    @profile = profile
    @user = usr
    @manager = @user.profile.first_name + " " + @user.profile.last_name
    hr = @user.profile.hr
    hr_profile = Profile.where('first_name = ?', hr)
    #mail to: "to@example.org"
    #mail(:to => @profile.user.email , :subject => "You have been released from #{@manager}", :cc => [@user.email, hr_profile.user.email] )
    mail(:to => "vinaykumarprabhu@gmail.com" , :subject => "You have been released from #{@manager}")
  end
  
  def new_select(profile,usr)
    @profile = profile
    @user = usr
    @manager = @user.profile.first_name + " " + @user.profile.last_name
    hr = @user.profile.hr
    hr_profile = Profile.where('first_name = ?', hr)
    #mail to: "to@example.org"
    #mail(:to => @profile.user.email , :subject => "#You have been selected by #{@manager}")
    mail(:to => @profile.user.email , :subject => "You have been released from #{@manager}" )
  end
  
  def new_send(profile,usr)
    @profile = profile
    @user = usr
    @manager = @user.profile.first_name + " " + @user.profile.last_name
    hr = @user.profile.hr
    hr_profile = Profile.where('first_name = ?', hr)
    #mail(:to => @profile.user.email , :subject => "You are selected for an interview!")
    #mail(:to => @profile.user.email , :subject => "You have been released from #{@manager}", :cc => user.email, hr_profile.user.email )
    mail(:to => "vinaykumarprabhu@gmail.com" , :subject => "You have been released from #{@manager}" )
  end
  
end

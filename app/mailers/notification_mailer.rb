class NotificationMailer < ApplicationMailer
    default from: "from@example.com"

    def notification
      @user = params[:user]
      @post = params[:post]
      mail(to: @user.email, subject: 'Novo artigo')
    end
  
end

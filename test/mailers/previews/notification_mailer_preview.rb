# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
    def notification_preview
        NotificationMailer.notification(User.first, Post.first)
    end
    
end

class ContactMailer < ApplicationMailer
    #default from:'from@example.com'
    #layout 'mailer'
    def contact_mail(blog)
        #@contact = contact
        @blog = blog
        ##@user = User.find(params[:id])
        mail to: @blog.user.email, subject:"お問い合わせの確認メール"
    end
end

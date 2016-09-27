class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2]


  has_many :events

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable



   def self.find_for_facebook_oauth(auth)
       user_params = auth.to_h.slice(:provider, :uid)
       user_params.merge! auth.info.slice(:email, :first_name, :last_name)
       user_params[:facebook_picture_url] = auth.info.image
       user_params[:token] = auth.credentials.token
       user_params[:token_expiry] = Time.at(auth.credentials.expires_at)

       user = User.where(provider: auth.provider, uid: auth.uid).first
       user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
       if user
         user.update(user_params)
       else
         user = User.new(user_params)
         user.password = Devise.friendly_token[0,20]  # Fake password for validation
         user.save
       end

       return user
     end

     # def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
     #     data = access_token.info
     #     user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
     #     if user
     #       return user
     #     else
     #       registered_user = User.where(:email => access_token.info.email).first
     #       if registered_user
     #         return registered_user
     #       else
     #         user = User.create(name: data["name"],
     #           provider:access_token.provider,
     #           email: data["email"],
     #           uid: access_token.uid ,
     #           password: Devise.friendly_token[0,20],
     #         )
     #       end
     #    end
     # end

     def self.find_for_google_oauth2(auth)
         data = auth.info
         if validate_email(auth)
           user = User.where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
             user.provider = auth.provider
             user.uid = auth.uid
             user.email = auth.info.email
             user.password = Devise.friendly_token[0,20]
           end
           user.token = auth.credentials.token
           user.refresh_token = auth.credentials.refresh_token
           user.save
           return user
         else
           return nil
         end
     end


end

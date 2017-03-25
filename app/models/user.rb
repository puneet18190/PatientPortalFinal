class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable

  validates :fullname, presence: true, length: {maximum: 50}
  
  has_many :practices
  has_many :appointments
  has_many :reviews
  has_many :reports
  has_many :bloodpressures
  has_many :bloodsugars
  has_many :heartbeats
  has_many :temperatures
  has_many :weights

  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.fullname = auth.info.name
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.image = auth.info.image
        user.password = Devise.friendly_token[0,20]
      end
  end
  
  def google_client
     client = Google::Apis::FitnessV1::FitnessService.new
     @g_data = client.users.dataSources.list
     
  end

end

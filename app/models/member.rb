class Member
  include Mongoid::Document

  after_create :if_root
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""
  field :username, :type => String, :default => ""
  field :rank, :type => String, :default => "root"
  
  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  has_and_belongs_to_many :projects, inverse_of: :members

  belongs_to :team
  has_many :comments
  has_many :messages
  has_many :todos

  def if_root
    if self.rank == 'root'
      member = Member.find(_id)
      puts member.username
      team = Team.create!
      team.members.push member
    end
  end

end

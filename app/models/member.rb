class Member
  include Mongoid::Document

  after_create :if_root

  def self.ranks
    [
      [1, 'Super user'],
      [2, 'Admin'],
      [3, 'User'],
      [4, 'Guest']
    ]
  end

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""
  field :username, :type => String, :default => ""
  field :rank, :type => Integer, :default => 1
  
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

  ## Validations
  validates_inclusion_of :rank, :in => (1..4).to_a

  ## Associations
  has_and_belongs_to_many :projects, inverse_of: :members
  has_and_belongs_to_many :teams, inverse_of: :members

  has_many :comments
  has_many :todos

  # What the member currently at
  belongs_to :current_team, class_name: "Team", inverse_of: :current_members

  private
  def if_root
    if self.rank == 1
      team = Team.create! name: "#{self.username}'s team"
      self.teams.push team
      self.current_team = team
      self.save
    end
  end

end

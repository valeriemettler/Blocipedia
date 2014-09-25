class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators



  default_scope { order('created_at DESC') }

  validates :title, length: { minimum: 1 }, presence: true
  validates :body, length: { minimum: 1 }, presence: true

  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  def should_generate_new_friendly_id?
    new_record?
  end

  def is_collaborator?(user)
    users.include?(user)
  end

  def collaborator_for(user)
    collaborators.where(user_id: user.id).first
  end

end



#Wiki.friendly.find(params[:id])

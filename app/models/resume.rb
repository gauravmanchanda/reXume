class Resume < ActiveRecord::Base
  belongs_to :user
  has_many :skills
  has_many :projects
  has_many :colleges
  has_one :address, as: :addressable

  validates :summary, presence: true

  accepts_nested_attributes_for :skills, :projects, :colleges, :address, allow_destroy: true, reject_if: lambda {|attr| attr.all? { |e| e.blank? }}
end

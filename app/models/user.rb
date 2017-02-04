# encoding: utf-8

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validations
  validates :email, :date_of_birth, presence: true
  validates :email, uniqueness: true

  # adult? is defined to show restricted content only for logged-in adult users.
  # in an ideal setting guest visitors should only be able to search for "safe" content,
  # which is already the default behavior of Flickr.
  def adult?
    (Date.today - date_of_birth.to_date).to_i / 365 >= 18
  end
end

# encoding: utf-8

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validations
  validates :email, :date_of_birth, presence: true
  validates :email, uniqueness: true

  def is_adult?
    # todo
  end
end

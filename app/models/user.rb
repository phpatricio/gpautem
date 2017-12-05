class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :alumno
  belongs_to :role
  def admin?
  	self.role.nombre == "admin"
  end
  def secretaria?
  	self.role.nombre == "secretaria"
  end
  def profesorguia?
  	self.role.nombre == "profesorguia"
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
end

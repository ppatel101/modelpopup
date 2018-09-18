class Student < ApplicationRecord
  validates :surname, :presence => {message: "Surname cannot be blank."}, 
            :length => { :minimum => 3, message: "surname is too short."}

  validates :firstname, :presence => {message: "Firstname cannot be blank."},
            :length => { :minimum => 3, message: "firstname is too short."}

  validates :lastname, :presence => {message: "Lastname cannot be blank."},
            :length => { :minimum => 3, message: "lastname is too short."}

  validates :div, :presence => {message: "Division cannot be blank."}, 
            inclusion: { in: %w(A B) , message: "Division only A or B." },
            :length => { :maximum => 1, message: "Division allowed only A or B."}

  validates :mobileno, :presence => {message: "Mobile No cannot be blank."}, 
            numericality: { only_integer: true , message: "Mobile No is only diigit."} ,
            :length => { :is => 10, message: "Mobile No is only 10 diigit."}

  def self.to_csv(options = {})
  	CSV.generate(options) do |csv|
    	csv << column_names
    	all.each do |student|
      	csv << student.attributes.values
    	end
  	end
	end
end
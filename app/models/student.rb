class Student < ApplicationRecord
	#validates :surname, :firstname , :lastname , :div , :mobileno , presence: true 
  validates :surname, :presence => {message: "Surname cannot be blank."},  :length => { :minimum => 2, message: "surname is too short."}
  validates :firstname, :presence => {message: "firstname content cannot be blank."}, :length => { :minimum => 2, message: "firstname is too short."}
  validates :lastname, :presence => {message: "lastname cannot be blank."},  :length => { :minimum => 2, message: "lastname is too short."}
  validates :div, :presence => {message: "Division cannot be blank."},  :length => { :maximum => 1, message: "Division is too long."}
  validates :mobileno, :presence => {message: "mobileno cannot be blank."},  :length => { :is => 10, message: "Mobile No is onlu 10 diigit."}

  def self.to_csv(options = {})
  	CSV.generate(options) do |csv|
    	csv << column_names
    	all.each do |student|
      	csv << student.attributes.values
    	end
  	end
	end
end
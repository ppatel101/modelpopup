class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :surname
      t.string :firstname
      t.string :lastname
      t.string :div
      t.string :mobileno

      t.timestamps
    end
  end
end

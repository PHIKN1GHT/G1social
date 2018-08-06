class CreateSitedposts < ActiveRecord::Migration[5.2]
  def change
    create_table :sitedposts do |t|
      t.text :content
      t.string :position

      t.timestamps
    end
  end
end

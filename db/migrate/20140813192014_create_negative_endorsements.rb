class CreateNegativeEndorsements < ActiveRecord::Migration
  def change
    create_table :negative_endorsements do |t|
      t.belongs_to :review, index: true

      t.timestamps
    end
  end
end

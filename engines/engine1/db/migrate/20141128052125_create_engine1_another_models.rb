class CreateEngine1AnotherModels < ActiveRecord::Migration
  def change
    create_table :engine1_another_models do |t|

      t.timestamps
    end
  end
end

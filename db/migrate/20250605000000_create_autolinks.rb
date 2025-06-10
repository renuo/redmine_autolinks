class CreateAutolinks < ActiveRecord::Migration[ActiveRecord::VERSION::STRING.to_f]
  def change
    return if table_exists?(:autolinks)

    create_table :autolinks do |t|
      t.string :prefix, null: false
      t.string :target_url, null: false
      t.belongs_to :project, null: false
      t.timestamps precision: 0
    end
  end
end

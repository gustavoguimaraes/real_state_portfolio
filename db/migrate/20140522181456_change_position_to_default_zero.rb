class ChangePositionToDefaultZero < ActiveRecord::Migration
  def change
    change_column :images, :position, :integer, default: 0
  end
end

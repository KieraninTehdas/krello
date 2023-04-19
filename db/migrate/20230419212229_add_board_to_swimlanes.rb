class AddBoardToSwimlanes < ActiveRecord::Migration[7.1]
  def change
    add_reference :swimlanes, :board, null: false, foreign_key: true
  end
end

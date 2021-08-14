class AddSetorToFuncionarios < ActiveRecord::Migration[5.2]
  def change
    add_column :funcionarios, :setor, :string
  end
end

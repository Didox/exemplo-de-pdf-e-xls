class Funcionario < ApplicationRecord
  default_scope { order("nome asc") }
end

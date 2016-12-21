class Micropost < ActiveRecord::Base
	belongs_to :user # Микросообщение пренадлежит пользователю. 
	default_scope -> { order('created_at DESC') } # Упорядочивание микросообщений с default_scope.
	validates :content, presence: true, length: { maximum: 140 } # # Валидация наличия, длины
	validates :user_id, presence: true  # Валидация наличия
end

# DESC это SQL для “по убыванию”

# Proc (процедура) или lambda, является стрелка ->
# принимают блок, а затем оценивают его когда их вызывают методом call.
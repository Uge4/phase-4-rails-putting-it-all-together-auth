class RecipesSerializer < ActiveModel::Serializer
  attributes :title, :instructions, :minutes_to_complete
end

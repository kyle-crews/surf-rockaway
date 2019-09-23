require_relative "./surf_data/version"
require_relative './surf_data/cli'
require_relative './surf_data/condition.rb'

require "recipe/version"
require "recipe/recipe"
require "recipe/category"
require "recipe/menu"

module SurfToday
  category = Category.get_category
  recipe = KetoRecipe.get_recipe(category)
  recipe.print
end
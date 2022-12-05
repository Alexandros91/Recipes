require_relative 'lib/database_connection'

DatabaseConnection.connect('recipes_library')

# sql = 'SELECT name, cooking_time, rating FROM recipes;'
# result = DatabaseConnection.exec_params(sql, [])
require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('bookmark_manager_test')
else
  # :nocov:
  DatabaseConnection.setup('bookmark_manager')
  # :nocov:
end
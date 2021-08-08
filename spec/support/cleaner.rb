# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:suite) { DatabaseCleaner.clean_with(:truncation) }
  config.before(:each)  { DatabaseCleaner.strategy = :transaction }
  config.before(:each)  { DatabaseCleaner.start }
  config.after(:each)   { DatabaseCleaner.clean }

  config.before(:all) { DatabaseCleaner.start }
  config.after(:all)  { DatabaseCleaner.clean }
end

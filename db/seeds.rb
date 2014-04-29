require 'active_record/fixtures'
ActiveRecord::FixtureSet.create_fixtures(Rails.root.join('test', 'fixtures'), ['questions', 'users', 'answers'])

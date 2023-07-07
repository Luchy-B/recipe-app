# frozen_string_literal: true

# Base class for all models in the application
class ApplicationRecord < ActiveRecord::Base
  # Marks the class as an abstract class
  primary_abstract_class
end

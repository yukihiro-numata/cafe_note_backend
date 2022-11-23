module Entities
  class BaseEntity < Grape::Entity
    root 'data', 'data'
    format_with(:iso_timestamp) { |dt| dt.iso8601 }
  end
end

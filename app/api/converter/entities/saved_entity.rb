module Converter
  module Entities
    class SavedEntity < Grape::Entity
      expose :message, documentation:
        {
          desc: 'Article is saved',
        }
    end
  end
end

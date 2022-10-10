module Converterv2
  module Entities
    class NotFoundEntity < Grape::Entity
      expose :error, documentation:
        {
          desc: 'Required data is unavailable',
        }
    end
  end
end

module Converterv2
  module Entities
    class ConverterEntity < Grape::Entity
      expose :total, documentation: { desc: 'total', default: 1 }
      expose :entities, using: Entities::DataEntity
      expose :page, documentation: { desc: 'page', default: 1 }
      expose :overdue, documentation: { desc: 'overdue', default: 1 }
    end
  end
  end
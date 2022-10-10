module Converter
  module Entities
    class ArticleEntity < Grape::Entity
      expose :id, documentation: { desc: 'id', default: 1 }
      expose :title, documentation: { desc: 'title', default: "Title_1" }
      expose :description, documentation: { desc: 'description', default: "Description_1" }
      expose :created_at, documentation: { desc: 'created_at', default: "2022-08-29T11:24:09.959Z" }
      expose :updated_at, documentation: { desc: 'updated_at', default: "2022-09-01T06:26:28.012Z" }
      expose :author_id, documentation: { desc: 'author_id', default: 1 }
      expose :status, documentation: { desc: 'status', default: "draft" }
    end
  end
end

module Converter
  module Entities
    class AuthorEntity < Grape::Entity
      expose :id, documentation: { desc: 'id', default: 1 }
      expose :name, documentation: { desc: 'name', default: "Ram" }
      expose :phone_number, documentation: { desc: 'phone_number', default: "1111111111" }
      expose :email, documentation: { desc: 'email', default: "author1@gmail.com" }
      expose :created_at, documentation: { desc: 'created_at', default: "2022-08-29T11:24:09.959Z" }
      expose :updated_at, documentation: { desc: 'updated_at', default: "2022-09-01T06:26:28.012Z" }
    end
  end
end

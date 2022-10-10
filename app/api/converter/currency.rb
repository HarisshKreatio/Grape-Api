
require 'grape-swagger'
module Converter
  class Currency < Grape::API
    version 'v1', using: :path
    format :json
    rescue_from :all

# --------------------------------------------------------------------------------------------------
# --------------------------------------------------------------------------------------------------
    resource :sites do

      desc 'To get a particular article',
           headers: {
             'Authorization' => {
               description: 'Validates your authorization.',
               required: true,
             },
           },
           success: { code: 201, model: Entities::ArticleEntity, message: 'Created' },
           failure: [{ code: 404, model: Entities::NotFoundEntity, message: 'Not Found' },
           ]

      params do
        requires :id, type: Integer
      end

      get 'article/:id' do
        Article.find(params[:id])
      end
# --------------------------------------------------------------------------------------------------
      desc 'To get all article',
           headers: {
             'Authorization' => {
               description: 'Validates your authorization.',
               required: true,
             },
           },
           success: { code: 201, model: Entities::ArticleEntity, message: 'Created' },
           failure: [{ code: 404, model: Entities::NotFoundEntity, message: 'Not Found' },
           ]

      get 'articles' do
        Article.all
      end
# --------------------------------------------------------------------------------------------------
      desc 'To get all the authors',
           headers: {
             'Authorization' => {
               description: 'Validates your authorization.',
               required: true,
             },
           },
           success: { code: 201, model: Entities::AuthorEntity, message: 'Created' },
           failure: [{ code: 404, model: Entities::NotFoundEntity, message: 'Not Found' },
           ]

      get 'authors' do
        Author.all
      end
# --------------------------------------------------------------------------------------------------
      desc 'To get a particular author',
           headers: {
             'Authorization' => {
               description: 'Validates your authorization.',
               required: true,
             },
           },
           success: { code: 201, model: Entities::AuthorEntity, message: 'Created' },
           failure: [{ code: 404, model: Entities::NotFoundEntity, message: 'Not Found' },
           ]

      params do
        requires :id, type: Integer
      end

      get 'author/:id' do
        Author.find(params[:id])
      end
# --------------------------------------------------------------------------------------------------
      desc 'To save a article as "draft"',
           headers: {
             'Authorization' => {
               description: 'Validates your authorization.',
               required: true,
             },
           },
           success: { code: 201, model: Entities::SavedEntity, message: 'Created' },
           failure: [{ code: 404, model: Entities::NotFoundEntity, message: 'Not Found' },
           ]

      params do
        requires :id, type: Integer
      end

      post 'article/:id/save/draft' do
        article = Article.find(params[:id])
        article.status = "draft"
        if article.save
          "Article is saved"
        else
          article.errors
        end
      end
# --------------------------------------------------------------------------------------------------
      desc 'To save a article as "publish"',
           headers: {
             'Authorization' => {
               description: 'Validates your authorization.',
               required: true,
             },
           },
           success: { code: 201, model: Entities::SavedEntity, message: 'Created' },
           failure: [{ code: 404, model: Entities::NotFoundEntity, message: 'Not Found' },
           ]

      params do
        requires :id, type: Integer
      end

      post 'article/:id/save/publish' do
        article = Article.find(params[:id])
        article.status = "publish"
        if article.save
          "Article is saved"
        else
          article.errors
        end
    end
  end
# --------------------------------------------------------------------------------------------------

    add_swagger_documentation mount_path: '/swagger_doc',
                              schemes: ['https'],
                              host: 'localhost:3050',
                              doc_version: '1.0.1',
                              info: {
                                title: 'Article Api',
                                license: 'Proprietary',
                                description: '
**Article API takes care of all the backend processes.**
                                ',
                              }


  end
end



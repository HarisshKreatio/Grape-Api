**Rspec**

Gem used: 
    gem 'rspec-rails'

Models testing:
    rspec ./spec/models/article_spec.rb
    rspec ./spec/models/author_spec.rb

Api testing:
    rspec ./spec/articles_api_spec.rb

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------

**Swagger doc**

Gem used: 
    gem 'grape-swagger'
    gem 'grape-swagger-entity'
    gem 'grape-swagger-rails'
    gem 'grape-entity'

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------

**API**

GET:
    http://localhost:3050/api/v1/sites/articles
    http://localhost:3050/api/v1/sites/article/2
    http://localhost:3050/api/v1/sites/authors
    http://localhost:3050/api/v1/sites/author/1

POST:
    http://localhost:3050/api/v1/sites/article/1/save/draft
    http://localhost:3050/api/v1/sites/article/1/save/publish

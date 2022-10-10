require 'spec_helper'
require 'rake'


describe Converter::Currency, type: :request do

  before(:each) do
    DatabaseCleaner.start
    Author.create(name: "Sam", phone_number: "33333333", email: "sam@gmail.com")
    Article.create(title: "Title_11", description: "Description_test_11", author_id: Author.first.id)

  end

  after(:all) do
    DatabaseCleaner.clean
  end

  context 'Api' do

    it "should list all the articles" do
      url = "/api/v1/sites/articles"
      get url
      response_body = JSON.parse(response.body)
      response_body.each do |article|
        @article_1 = article if article['title'] == "Title_11"
      end
      expect(response.status).to eq(200)
      expect(@article_1['title']).to eq("Title_11")
    end

    it "should return one article" do
      article = Article.find_by_title "Title_11"
      url = "/api/v1/sites/article/#{article.id}"
      get url
      response_body = JSON.parse(response.body)
      expect(response_body['title']).to eq("Title_11")
    end

    it "should list all authors" do
      url = "/api/v1/sites/authors"
      get url
      response_body = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(response_body.last['name']).to eq("Sam")
    end

    it "should return one author" do
      author = Author.find_by_name "Sam"
      url = "/api/v1/sites/author/#{author.id}"
      get url
      response_body = JSON.parse(response.body)
      expect(response_body['name']).to eq("Sam")
    end

    it "should change the status of the article to draft" do
      article = Article.find_by_title "Title_11"
      url = "/api/v1/sites/article/#{article.id}/save/draft"
      post url
      response_body = JSON.parse(response.body)
      expect(response_body).to eq("Article is saved")
      expect(response.status).to eq(201)
    end

    it "should change the status of the article to publish" do
      article = Article.find_by_title "Title_11"
      url = "/api/v1/sites/article/#{article.id}/save/publish"
      post url
      response_body = JSON.parse(response.body)
      expect(response_body).to eq("Article is saved")
      expect(response.status).to eq(201)
    end

  end

end

# require 'rails_helper'

RSpec.describe Article, type: :model do

  context 'validation tests' do

    it 'ensures title is present'do
      article = Article.new(description: "Description_test").save
      expect(article).to eq(false)
    end

    it 'ensures description is present'do
      article = Article.new(title: "Title_test").save
      expect(article).to eq(false)
    end

    it 'ensures length of title is (5-10)'do
      article = Article.new(title: "hi", description: "Description_test").save
      expect(article).to eq(false)
    end

    it 'ensures length of description is (5-100)'do
      article = Article.new(title: "Title_test", description: "des").save
      expect(article).to eq(false)
    end

  end

  context 'association'do

    it 'should belongs to author' do
      t = Article.reflect_on_association(:author)
      expect(t.macro).to eq(:belongs_to)
    end

  end

end

# require 'rails_helper'

RSpec.describe Author, type: :model do
  before(:each) do
    Author.new(name: "Sam", phone_number: "123123123", email: "sam@gmail.com").save
  end

  after(:each) do
    Author.where(name: "Sam").delete_all
  end

  context 'Validate author' do

    it 'ensure author name is present' do
      author = Author.new(phone_number: "1231231", email: "jim@gmail.com").save
      expect(author).to eq(false)
    end

    it 'ensure author email is present' do
      author = Author.new(name: "Sam",phone_number: "1231231").save
      expect(author).to eq(false)
    end

    it 'ensure author name is unqiue' do
      author = Author.new(name: "Sam", phone_number: "123123123", email: "jin@gmail.com").save
      expect(author).to eq(false)
    end

    it 'ensure author email is unique' do
      author = Author.new(name: "jim", phone_number: "123123123", email: "sam@gmail.com").save
      expect(author).to eq(false)
    end

    it 'ensure author email is in correct format' do
      author = Author.new(name: "lev", phone_number: "12312313", email: "lev@gmail").save
      expect(author).to eq(false)
    end

  end

  context 'association'do

    it 'should have many articles' do
      t = Author.reflect_on_association(:articles)
      expect(t.macro).to eq(:has_many)
    end

  end
end

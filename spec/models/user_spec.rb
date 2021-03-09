require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is valid with valid attributes" do 
      @user = User.new(name: "Alvin", email: "ngoalvin97@gmail.com", password: "123456789")
      @user.save!
      expect(@user).to be_valid
    end
    it "is valid with valid attributes" do 
      @user = User.new(name: "Alvin", email: "ngoalvin97@gmail.com", password: "123456789")
      @user.save!
      @user2 = User.new(name: "Alvin", email: "ngoalvin97@gmail.com", password: "123456789")
      @user2.save
      expect(@user2).to_not be_valid
    end
    it "is invalid with only name" do 
      @user = User.new(name: "Alvin")
      @user.save
      expect(@user).to_not be_valid
    end
    it "is invalid with only email" do 
      @user = User.new(email: "ngoalvin97@gmail.com")
      @user.save
      expect(@user).to_not be_valid
    end
    it "is invalid with only password" do 
      @user = User.new(password: "123456789")
      @user.save
      expect(@user).to_not be_valid
    end
  end
  describe '.authenticate_with_credentials' do
    it "logs user in with valid credentials" do
      @user = User.new(name: "Alvin", email: "ngoalvin97@gmail.com", password: "123456789")
      @user.save
      user = User.authenticate_with_credentials("ngoalvin97@gmail.com", "123456789")
      expect(user).to be == @user
    end
    it "does not log user in with invalid credentials" do
      @user = User.new(name: "Alvin", email: "ngoalvin97@gmail.com", password: "123456789")
      @user.save
      user = User.authenticate_with_credentials("ngoalvin97@gmail.com", "1234")
      expect(user).to_not be == @user
    end   
    it "logs in user with caps" do
      @user = User.new(name: "Alvin", email: "ngoalvin97@gmail.com", password: "123456789")
      @user.save
      user = User.authenticate_with_credentials("nGoalvIn97@gmail.com", "123456789")
      expect(user).to be == @user
    end 
    it "logs in user with whitespace" do
      @user = User.new(name: "Alvin", email: "ngoalvin97@gmail.com", password: "123456789")
      @user.save
      user = User.authenticate_with_credentials(" nGoalvIn97@gmail.com ", "123456789")
      expect(user).to be == @user
    end
  end
end

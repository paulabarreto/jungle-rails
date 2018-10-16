require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(name: "Anything", email: "g@test.com", password: "Anything", password_confirmation: "Anything")
  }

  describe 'Validations' do
    # validation tests/examples here
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is not valid if password_confirmation doesn't match" do
      subject.password = "123456"
      subject.password_confirmation = "1234567"
      expect(subject).to_not be_valid
    end

    it "it should have a unique email" do
      User.create!(name: "Name", :email=>"Foo", password: "123456", password_confirmation: "123456")
      user = User.new(:email=>"Foo")
      expect(user).to_not be_valid
      user.errors[:email].should include("has already been taken")
    end

    it "validates password length" do
      subject.password = "1234"
      expect(subject).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    it "should support spaces before/after email" do
      User.create!(name: "Name", email: "xy@mail.com", password: "123456", password_confirmation: "123456")
      user = User.authenticate_with_credentials("  xy@mail.com  ", "123456")
      expect(user).not_to be_nil
    end

    it "should support spaces email with uppercase" do
      User.create!(name: "Name", email: "xy@mail.com", password: "123456", password_confirmation: "123456")
      user = User.authenticate_with_credentials("Xy@mail.com", "123456")
      expect(user).not_to be_nil
    end
  end
end

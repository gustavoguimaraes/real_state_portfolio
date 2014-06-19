require 'spec_helper'

describe User do

  describe ".find_or_create_google" do

    let(:auth_hash) {
      {
        :provider => "google_oauth2",
        :uid => "123456789",
        :info => {
            :name => "John Doe",
            :email => "john@company_name.com",
            :first_name => "John",
            :last_name => "Doe",
            :image => "https://lh3.googleusercontent.com/url/photo.jpg"
        },
        :credentials => {
            :token => "token",
            :refresh_token => "another_token",
            :expires_at => 1354920555,
            :expires => true
        },
        :extra => {
            :raw_info => {
                :id => "123456789",
                :email => "user@domain.example.com",
                :verified_email => true,
                :name => "John Doe",
                :given_name => "John",
                :family_name => "Doe",
                :link => "https://plus.google.com/123456789",
                :picture => "https://lh3.googleusercontent.com/url/photo.jpg",
                :gender => "male",
                :birthday => "0000-06-25",
                :locale => "en",
                :hd => "company_name.com"
            }
        }
      }
    }

    it "creates a user with google info set" do
      user = User.find_or_create_google(auth_hash)
      expect(user).to be_persisted
      expect(user.email).to eq(auth_hash[:info][:email])
      expect(user.name).to eq(auth_hash[:info][:name])
    end

    it "finds a matching user" do
      user = User.create(email: "john@company_name.com")
      expect(User.find_or_create_google(auth_hash)).to eq(user)
    end

    it "updates name with new info" do
      User.create(email: "john@company_name.com", name:"bob")
      expect(User.find_or_create_google(auth_hash).name).to_not eq("bob")
    end

    it "updates avatar with new info" do
      User.create(email: "john@company_name.com", avatar:"http://placekitten.com/400")
      expect(User.find_or_create_google(auth_hash).name).to_not eq("http://placekitten.com/400")
    end

  end

end

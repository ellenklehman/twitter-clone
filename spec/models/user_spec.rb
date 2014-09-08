require 'rails_helper'

describe User do
  it { should have_many :followings }
  it { should have_many(:followeds).through(:followings)}
  it { should validate_presence_of :email }

end

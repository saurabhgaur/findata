require 'spec_helper'

describe FamilyMember do

  let(:user) { FactoryGirl.create(:user) }
  before do
    @family_member = user.family_members.build(name: "test family member", email_id:"test@findata.com")
  end

  subject { @family_member }

  it { should respond_to(:name) }
  it { should respond_to(:email_id) }
  it { should respond_to(:user_id) }
  it { should be_valid }

  describe "when user_id is not present" do
    before { @family_member.user_id = nil }
    it { should_not be_valid }
  end
end
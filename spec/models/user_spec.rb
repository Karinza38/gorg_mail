# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  hruid                  :string
#  firstname              :string
#  lastname               :string
#  role_id                :integer
#  last_gram_sync_at      :datetime
#

require 'rails_helper'


RSpec.describe User, type: :model do

  describe "lists_allowed" do
    it "list has a valid factory" do
      expect(build(:ml_list)).to be_valid
    end

    it "return allowed list" do
      group_uuid = SecureRandom.uuid

      user = create(:user)
      user_groups = [{"uuid"=> group_uuid}]

      # allow(user).to reveive(:grouos).and_return(:user_groups)

      an_open_inscription_list = build(:ml_list, inscription_policy: "open")
      a_closed_inscription_list = build(:ml_list, inscription_policy: "closed")
      a_list_in_the_same_group_as_user = build(:ml_list, group_uuid: group_uuid, inscription_policy: "in_group")
      a_closed_inscription_list_in_the_same_group_as_user = build(:ml_list, group_uuid: group_uuid, inscription_policy: "closed")

      # list_allowed = user.lists_allowed

      # expect(list_allowed).to include(an_list_in_the_same_group_as_user)
      # expect(list_allowed).to include(a_list_in_the_same_group_as_user)
      # expect(list_allowed).to include(a_closed_inscription_list_in_the_same_group_as_user)
      # expect(list_allowed).to_not include(a_closed_inscription_list)
    end
  end

  describe 'find by id or hruid' do
    let!(:user) { create(:user)}

    it "find by id" do
      expect(User.find_by_id_or_hruid_or_uuid(user.id)).to eq(user)
    end

    it "find by uuid" do
      expect(User.find_by_id_or_hruid_or_uuid(user.uuid)).to eq(user)
    end

    it "find by hruid" do
      expect(User.find_by_id_or_hruid_or_uuid(user.hruid)).to eq(user)
    end

    describe "type conversion bug" do
      let!(:user1) { create(:user, id: 5)}
      let!(:user2) { create(:user, id: 6,uuid: "5b3ed219-9d22-4091-a7d8-6028273b3a70")}

      it "find by uuid" do
        expect(User.find_by_id_or_hruid_or_uuid(user2.uuid)).to eq(user2)
      end

    end
  end

  describe "primary emails on collections" do

    it "returns existing primary emails" do
      user1= create(:user_with_addresses)
      user2= create(:user_with_addresses)
      user3= create(:user)

      expect(User.all.primary_emails).to match_array([user1.primary_email.to_s,user2.primary_email.to_s])
    end

  end

  describe "contact emails" do

    it "returns primary emails when existing" do
      user1= create(:user_with_addresses)
      expect(user1.contact_email).to eq(user1.primary_email.to_s)
    end

    it "returns account email when there is no primary email" do
      user1= create(:user)
      expect(user1.contact_email).to eq(user1.email)
    end

    describe "on collection" do
      it "a list of contact emails" do
        user1= create(:user_with_addresses)
        user2= create(:user_with_addresses)
        user3= create(:user)

        expect(User.all.contact_emails).to match_array([user1.primary_email.to_s,user2.primary_email.to_s, user3.email])
      end
    end

  end



end

require 'rails_helper'

RSpec.describe Friend, type: :model do
  context 'start block chain' do
    it 'create new block' do   #
      # expect { Post.create.comments.create! }.to raise_error(ActiveRecord::RecordInvalid)  # test code
      expect {Friend.create!}
    end
  end
end

require 'rails_helper'

RSpec.describe Block, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'start block chain' do
    it 'create new block' do   #
      # expect { Post.create.comments.create! }.to raise_error(ActiveRecord::RecordInvalid)  # test code
      expect {Block.create!(user_id: 1)}
    end
  end
end

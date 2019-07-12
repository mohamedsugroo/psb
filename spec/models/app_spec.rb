require 'rails_helper'

RSpec.describe App, type: :model do
  context 'start block chain' do
    it 'create new block' do   #
      # expect { Post.create.comments.create! }.to raise_error(ActiveRecord::RecordInvalid)  # test code
      expect {App.create!}
    end
  end
end
require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validation' do
    it 'is valid with all attributes' do
      task = build(:task)
      expect(task).to be_valid
      expect(task.errors).to be_empty
    end

    it 'is invalid without title' do end
    it 'is invalid without status' do end
    it 'is invalid with a duplicate title' do end
    it 'is valid with another title' do end
  end
  pending "add some examples to (or delete) #{__FILE__}"
end

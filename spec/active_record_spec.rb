require 'spec_helper'

describe 'HeightRails::ActiveRecord' do
  describe '#height' do
    it 'returns height for standard model' do
      user = User.new(191)
      user.height.should == Height.new(191)
    end

    it 'returns height for model with custom height field' do
      user = UserWithCustomHeightField.new(191)
      user.height.should == Height.new(191)
    end
  end

  describe '#height=' do
    it 'assigns from string' do
      user = User.new(191)
      user.height = '192cm'
      user.height.should == Height.new(192)
    end

    it 'assigns from Height class' do
      user = User.new(191)
      user.height = Height.new(192)
      user.height.should == Height.new(192)
    end
  end
end
require 'spec_helper'
require 'action_view'

module ActionView
  module Helpers
    describe '#height_select' do
      before do
        @template = ActionView::Base.new
        @user = User.new(191)
        @builder = FormBuilder.new(:user, @user, @template, {}, Proc.new { })
      end
      it 'a' do
        binding.pry
        puts @builder.height_select :height
      end
    end
  end
end
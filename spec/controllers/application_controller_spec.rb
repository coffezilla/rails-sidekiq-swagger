require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe '#set_name' do
    it 'returns a User_ prefix and number within range' do
      generated_name = controller.set_name

      expect(generated_name).to match(/\AUser_\d+\z/)

      random_number = generated_name.split('_').last.to_i
      expect(random_number).to be_between(1, 1000)
    end
  end
end

require 'rails_helper'

RSpec.describe Image, :type => :model do
    describe ' generate file name'do
      it 'has unique code'do
      old_code = SecureRandom.uuid
      new_code = Code.generate_random_uniq_code
      new_code.should_not eq old_code
      end
    end
end

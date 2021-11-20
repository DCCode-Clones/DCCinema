require 'rails_helper'

RSpec.describe 'Welcome' , type: :system do
    it 'index' do
        visit '/'
        expec(page).to have_content('Welcome to the DCCinema')
    end
end
require 'rails_helper'

# Tests

RSpec.configure do |config|
    config.before(:each, type: :system) do
      driven_by :rack_test
    end
  
    config.before(:each, type: :system, js: true) do
      driven_by :chrome_headless
    end
end

RSpec.describe 'Create movie view' , type: :system do
    it 'index' do
        visit '/movies/new?'    
        expect(page).to have_content('Create a new movie function')
    end
end

RSpec.describe 'Create movie form' , type: :system do
    it 'index' do
        visit '/movies/new?'
        check('rooms_0_4')
        expect(page).to have_content('Create a new movie function')
        fill_in 'name', with: 'Nueva Película'
        fill_in 'imgURL', with: 'https://i.blogs.es/26ba45/star-wars-eras/1366_2000.jpeg'
        fill_in 'start_date', with: Date.current
        fill_in 'end_date', with: Date.current
        click_on("Create")
        expect(page).to have_content('Welcome to the DCCinema')
    end
end

RSpec.describe 'Welcome' , type: :system do
    it 'index' do
        visit '/' 
        expect(page).to have_content('Welcome to the DCCinema')
    end
end

RSpec.describe 'View Movies' , type: :system do
    it 'index' do
        visit '/' 
        if page.has_content?('Welcome to the DCCinema')
            expect(page).to have_css('div.grid-item')
        else
            expect(page).not_to have_css('div.grid-item')
        end
    end
end

RSpec.describe 'view schedule' , type: :system do
    it 'index' do
        visit '/schedules/1'    
        expect(page).to have_content('Star Wars')
    end
end

RSpec.describe 'schedule seat' , type: :system do
    it 'index' do
        visit '/schedules/1'
        choose('row_3')   
        check("seats_11")
        click_on("Reserve")
        expect(page).to have_css('div.grid-item-unavailable')
    end
end

RSpec.describe 'schedule seat error' , type: :system do
    it 'index' do
        visit '/schedules/1'
        choose('row_3')   
        check("seats_11")
        click_on("Reserve")
        choose('row_3')   
        check("seats_11")
        click_on("Reserve")
        expect(page).to have_content('The request of reservation is invalid')
    end
end

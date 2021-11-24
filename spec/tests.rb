require 'rails_helper'



Capybara.server = :puma, { Silent: true }

Capybara.register_driver :chrome_headless do |app|
    options = ::Selenium::WebDriver::Chrome::Options.new
  
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    options.add_argument('--window-size=1400,1400')
  
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.javascript_driver = :chrome_headless



# Tests

RSpec.configure do |config|
    config.before(:each, type: :system) do
      driven_by :rack_test
    end
  
    config.before(:each, type: :system, js: true) do
      driven_by :chrome_headless
    end
end

RSpec.describe 'Create movie' , type: :system do
    it 'index' do
        visit '/movies/new?'    
        expect(page).to have_content('Create a new movie function')
    end
end

RSpec.describe 'Welcome' , type: :system do
    it 'index' do
        visit '/'    
        expect(page).to have_content('Welcome to the DCCinema')
    end
end

RSpec.describe 'view schedule' , type: :system do
    it 'index' do
        visit '/schedules/30'    
        expect(page).to have_content('Schedule for Los Simpsons')
    end
end

RSpec.describe 'schedule seat' , type: :system do
    it 'index' do
        visit '/schedules/31'
        choose('row_0')   
        check("seats_0")
        click_on("Reserve")
        expect(page).to have_css('div.grid-item-unavailable')
    end
end
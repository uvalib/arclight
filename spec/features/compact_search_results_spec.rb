# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Compact Search Results', type: :feature do
  scenario 'As a user I should be able to view results in a compact display' do
    visit root_path
    click_button 'Search'

    expect(page).to have_css('.documents-list')
    expect(page).to have_css('h3.index_title', text: 'Alpha Omega Alpha Archives, 1894-1992')

    click_link 'Compact'

    expect(page).not_to have_css('.documents-list')
    expect(page).to have_css('.documents-compact')
    expect(page).to have_css('article.document', count: 10)
    within '.document-position-0' do
      expect(page).to have_css '.col-5 .al-repository-footer', text: /National Library of/
    end
  end
end

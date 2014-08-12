def leave_2_reviews
  visit ('/restaurants')
  click_link('Review Vanilla Black')
  fill_in 'Comments', with: "Awesome!"
  select '5', from: 'Rating'
  click_button('Submit review')

  click_link ('Review Vanilla Black')
  fill_in 'Comments', with: "OK"
  select '3', from: 'Rating'
  click_button('Submit review')
end

def leave_3_reviews
  visit ('/restaurants')
  click_link('Review Vanilla Black')
  fill_in 'Comments', with: "Awesome!"
  select '5', from: 'Rating'
  click_button('Submit review')

  click_link ('Review Vanilla Black')
  fill_in 'Comments', with: "OK"
  select '3', from: 'Rating'
  click_button('Submit review')

  click_link ('Review Vanilla Black')
  fill_in 'Comments', with: "OK"
  select '2', from: 'Rating'
  click_button('Submit review')
end


def add_restaurant
  visit ('/restaurants/new')
  fill_in 'Name', with: "Vanilla Black"
  fill_in 'Cuisine', with: "Vegetarian"
  click_button 'Create Restaurant'
end

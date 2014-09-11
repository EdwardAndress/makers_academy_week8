def leave_review(comments, rating)
  visit ('/restaurants')
  click_link('Review Vanilla Black')
  fill_in 'Comments', with: comments
  select rating, from: 'Rating'
  click_button('Submit review')
end

def leave_2_reviews
  fred = User.create(email: 'fred@fred.com', password: '12345678', password_confirmation: '12345678')
  humphrey = User.create(email: 'humphrey@humphrey.com', password: '12345678', password_confirmation: '12345678')
  
  login_as(fred)
  visit ('/restaurants')
  click_link('Review Vanilla Black')
  fill_in 'Comments', with: "Awesome!"
  select '5', from: 'Rating'
  click_button('Submit review')

  login_as(humphrey)
  click_link ('Review Vanilla Black')
  fill_in 'Comments', with: "OK"
  select '3', from: 'Rating'
  click_button('Submit review')
end


def add_restaurant
  visit ('/restaurants/new')
  fill_in 'Name', with: "Vanilla Black"
  fill_in 'Cuisine', with: "Vegetarian"
  click_button 'Create Restaurant'
end
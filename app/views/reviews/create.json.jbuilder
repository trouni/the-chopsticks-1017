# We use Jbuilder to create a JSON response using Ruby

# # Syntax
# json.test_key "it works" # will create this json: { "test_key": "it works" }

# # We could pass the attributes of the review...
# json.content @review.content
# json.rating @review.rating
# json.created_at @review.created_at
# # ...but it won't give us the HTML design of the card

# Instead, we render the partials as strings
if @review.persisted?
  json.item_html(render(partial: 'reviews/review', formats: :html, locals: { review: @review }))
  # We render the form with a new review to empty the relevant fields
  json.form_html(render(partial:  'reviews/form', formats: :html, locals: { restaurant: @review.)restaurant, review: Review.new })
else
  # We render the form with the error messages if the save failed
  json.form_html(render(partial:  'reviews/form', formats: :html, locals: { restaurant: @review.restaurant, review: @review }))
end
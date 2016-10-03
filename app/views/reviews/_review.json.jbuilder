json.extract! review, :id, :overall, :safety, :clean, :noise, :price, :comment, :rental_id, :created_at, :updated_at
json.url review_url(review, format: :json)
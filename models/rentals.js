var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var image = new Schema({
   filename: {type: String}
});

var review = new Schema({
   Overall: Number,
    NeighborhoodSafety: Number,
    Cleanliness: Number,
    NoiseLevel: Number,
    Price: Number,
    Comments: String
});

var address_schema = new Schema({
   full_street_add: {type: String, required: true }, // Full address
    street_num: {type: Number, required: true },
    street_name: {type: String, required: true},
    zip_code: {type: Number, required: true},
    city: {type: String, required: true},
    country: {type: String, required: true}
});

var details_schema = new Schema({
   bedrooms: {type: Number, required: true},
    bathrooms: {type: Number, required: true},
    is_complex: Boolean,
    stories: {type: Number, required: true},
    company_owned: Boolean,
    owner: String
});

var amenities_schema = new Schema({
   parking: Boolean,
    pets: Boolean,
    washer_dryer: Boolean,
    pool: Boolean,
    spa: Boolean,
    gym: Boolean,
    dishwasher: Boolean,
    central_air: Boolean,
    heater: Boolean 
});

var utilities_schema = new Schema({
   gas: Boolean,
    electricity: Boolean,
    trash: Boolean,
    water: Boolean,
    tv: Boolean,
    wifi: Boolean
});

var rental_schema = new Schema({
   address: address_schema,
    details: details_schema,
    amenities: amenities_schema,
    utilities: utilities_schema,
    rental_reviews: [review],
    rental_images: [image]
});

rental = mongoose.model('Rental', rental_schema);

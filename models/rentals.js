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
    is_complex: {type: Boolean, default: false},
    stories: Number,
    company_owned: {type: Boolean, default: false},
    owner: String
});

var amenities_schema = new Schema({
   parking: {type: Boolean, default: false},
    pets: {type: Boolean, default: false},
    washer_dryer: {type: Boolean, default: false},
    pool: {type: Boolean, default: false},
    spa: {type: Boolean, default: false},
    gym: {type: Boolean, default: false},
    dishwasher: {type: Boolean, default: false},
    central_air: {type: Boolean, default: false},
    heater: {type: Boolean, default: false}
});

var utilities_schema = new Schema({
   gas: {type: Boolean, default: false},
    electricity: {type: Boolean, default: false},
    trash: {type: Boolean, default: false},
    water: {type: Boolean, default: false},
    tv: {type: Boolean, default: false},
    wifi: {type: Boolean, default: false}
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

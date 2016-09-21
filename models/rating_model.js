var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var rental_schema = new Schema({
    address: [
      full_street_add: {type: String, required: true }, //Full address
      street_num: {type: Number, required: true },
      street_name: {type: String, required: true},
      street_type: {type: String, required: true},
      zip_code: {type: Number, required: true},
      city: {type: String, required: true},
      country: {type: String, required: true}
    ],

    rental_details: [
      bedrooms: {type: Number, required: true},
      bathrooms: {type: Number, required: true},
      is_complex: {type: Boolean, default: false},
      stories: {type: Number, required: true},
      company_owned: {type: Boolean, required: true},
      owner: String
    ],

    amenities: [
      parking: {type: Boolean, default: false},
      pets: {type: Boolean, default: false},
      washer_dryer: {type: Boolean, default: false},
      pool: {type: Boolean, default: false},
      spa: {type: Boolean, default: false},
      gym: {type: Boolean, default: false},
      dishwasher: {type: Boolean, default: false},
      central_air: {type: Boolean, default: false},
      heater: {type: Boolean, default: false}
    ],

    utilities_included: [
      gas: {type: Boolean, default: false},
      electricity: {type: Boolean, default: false},
      trash: {type: Boolean, default: false},
      water: {type: Boolean, default: false},
      television: {type: Boolean, default: false},
      internet: {type: Boolean, default: false}
    ],

    rental_reviews: [review],
    rental_images: [image]
});

mongoose.model('Rental', rental_schema);

var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var ratingSchema = new Schema({
    address: [
      streetNum: {type: Number, required: true },
      streetName: {type: String, required: true},
      streetType: {type: String, required: true},
      zipCode: {type: Number, require: true},
      city: {type: String, require: true},
      country: {type: String, require: true}
    ],

    amenities: [
      washer: {type: Boolean, default: false}, //Should this be a string with a
      //dropdown as the answer on the set up page?
    ]
});

mongoose.model('Rating', ratingSchema);

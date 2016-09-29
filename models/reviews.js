var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var review = new Schema({
   overall: Number,
    neighborhood_safety: Number,
    clean_level: Number,
    noise_level: Number,
    price: Number,
    comment: String,
    rental: { type: mongoose.Schema.Types.ObjectId, ref: "Rental" }
});

review = mongoose.model('Review', review);

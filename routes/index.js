var express = require('express');
var passport = require('passport');
var Account = require('../models/account');
var router = express.Router();

var mongoose = require('mongoose');

var Rental = mongoose.model('Rental');
var Review = mongoose.model('Review');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' }),
  res.render('index', { user : req.user });
});

router.get('/register', function(req, res) {
  res.render('register', { });
});

router.post('/register', function(req, res) {
  Account.register(new Account({ username : req.body.username }), req.body.password, function(err, account) {
    if (err) {
      return res.render('register', { account : account });
    }

    passport.authenticate('local')(req, res, function () {
      res.redirect('/');
    });
  });
});

router.get('/login', function(req, res) {
  res.render('/login',{ user : req.user });
});

router.post('/login', passport.authenticate('local'), function(req, res) {
  res.redirect('/');
});

router.get('/logout', function(req, res) {
  req.logout();
  res.redirect('/');
});

// XXX I this is just chekcing if the pages work
// can be removed late, but it is kinda a fun easter egg
router.get('/ping', function(req, res){
  res.status(200).send("pong!");
});

router.get('/rentals', function(req, res, next) {
  Rental.find(function(err, rentals){
    if(err){ return next(err); }

    res.json(rentals);
  });
});

router.post('/rentals', function(req, res, next) {
  var rental = new Rental(req.body);
  console.log(rental + " rent");

  rental.save(function(err, rental){
    if(err){ return next(err); }

    res.json(rental);
  });
});

router.param('rental', function(req, res, next, id) {
  var query = Rental.findById(id);

  query.exec(function (err, rental){
    if (err) { return next(err); }
    if (!rental) { return next(new Error('can\'t find rental')); }

    req.rental = rental;
    return next();
  });
});

router.param('review', function(req, res, next, id) {
  var query = Review.findById(id);

  query.exec(function (err, review){
    if (err) { return next(err); }
    if (!review) { return next(new Error('can\'t find review')); }

    req.review = review;
    return next();
  });
});

router.get('/rentals/:rental', function(req, res, next) {
  req.rental.populate('reviews', function(err, rental) {
    if (err) { return next(err); }

    res.json(rental);
  });
});

router.post('/rentals/:rental/reviews', function(req, res, next) {
  var review = new Review(req.body);
  review.rental = req.rental._id;
  console.log(review + " review");

  review.save(function(err, review){
    if(err){ return next(err); }

    req.rental.reviews.push(review);
    req.rental.save(function(err, rental) {
      if(err){ return next(err); }

      res.json(review);
    });
  });
});

module.exports = router;

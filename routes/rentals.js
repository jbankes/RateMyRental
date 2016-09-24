var express = require('express');
var router = express.Router();
var mongoose = require('mongoose'); //mongo connection
var bodyParser = require('body-parser'); //parses information from POST
var methodOverride = require('method-override'); //used to manipulate POST

router.use(bodyParser.urlencoded({ extended: true }))
   router.use(methodOverride(function(req, res){
      if (req.body && typeof req.body === 'object' && '_method' in req.body) {
         // look in urlencoded POST bodies and delete it
         var method = req.body._method
      delete req.body._method
      return method
      }
   }));

// build the REST operations at the base for rentals
// this will be accessible from http://127.0.0.1:3000/rentals if the default route for / is left unchanged
router.route('/')
// GET all rentals
.get(function(req, res, next) {
   // retrieve all rentals from Monogo
   mongoose.model('Rental').find({}, function (err, rentals) {
      if (err) {
         return console.error(err);
      } else {
         // respond to both HTML and JSON. JSON responses require 'Accept: application/json;' in the Request Header
         res.format({
            // HTML response will render the index.jade file in the views/rentals folder.
            // We are also setting "rentals" to be an accessible variable in our jade view
            html: function(){
                     res.render('rentals/index', {
                        title: 'All my Rentals',
                        "rentals" : rentals
                     });
                  },
            // JSON response will show all rentals in JSON format
            json: function(){
                     res.json(rentals);
                  }
         });
      }     
   });
})

// POST a new rental
.post(function(req, res) {
   // Get values from POST request. These can be done through forms or REST calls. These rely on the "name" attributes for forms
   // address
   var full_street_add = req.body.full_street_add;
   var street_num = req.body.street_num;
   var street_name = req.body.street_name;
   var zip_code = req.body.zip_code;
   var city = req.body.city;
   var country = req.body.country;

   // details
   var bedrooms = req.body.bedrooms;
   var bathrooms = req.body.bathrooms;
   var is_complex = req.body.is_complex;
   var stories = req.body.stories;
   var company_owned = req.body.company_owned;
   var owner = req.body.owner;

   // amenities
   var parking = req.body.parking;
   var pets = req.body.pets;
   var washer_dryer = req.body.washer_dryer;
   var pool = req.body.pool;
   var spa = req.body.spa;
   var gym = req.body.gym;
   var dishwasher = req.body.dishwasher;
   var central_air = req.body.central_air;
   var heater = req.body.heater;

   // utilites
   var gas = req.body.gas;
   var electricity = req.body.electricity;
   var trash = req.body.trash;
   var water = req.body.water;
   var tv = req.body.tv;
   var wifi = req.body.wifi;

   // call the create function for our database
   mongoose.model('Rental').create({
      address: {
        full_street_add : full_street_add,
        street_num : street_num,
        street_name : street_name,
        zip_code : zip_code,
        city : city,
        country : country
      },
      details: {
        bedrooms : bedrooms,
        bathrooms : bathrooms,
        is_complex : is_complex,
        stories : stories,
        company_owned : company_owned,
        owner : owner
      },
      amenities: {
        parking : parking,
        pets : pets,
        washer_dryer : washer_dryer,
        pool: pool,
        spa: spa,
        gym: gym,
        dishwasher: dishwasher,
        central_air: central_air,
        heater: heater
      },
      utilities: {
        gas: gas,
        electricity: electricity,
        trash: trash,
        water: water,
        tv: tv,
        wifi: wifi
      }
   }, function (err, rental) {
      if (err) {
         console.log(full_street_add + "  " + street_num + " " + bedrooms);
         console.log(err);
         res.send("There was a problem adding the information to the database.");
      } else {
         // Rental has been created
         console.log('POST creating new rental: ' + rental);
         res.format({
            // HTML response will set the location and redirect back to the home page. 
            // You could also create a 'success' page if that's your thing
            html: function(){
                     // If it worked, set the header so the address bar doesn't still say /adduser
                     res.location("rentals");
                     // And forward to success page
                     res.redirect("/rentals");
                  },
            // JSON response will show the newly created rental
            json: function(){
                     res.json(rental);
                  }
         });
      }
   })
});

/* GET New Rental page. */
router.get('/new', function(req, res) {
   res.render('rentals/new', { title: 'Add New Rental' });
});

// route middleware to validate :id
router.param('id', function(req, res, next, id) {
   // console.log('validating ' + id + ' exists');
   // find the ID in the Database
   mongoose.model('Rental').findById(id, function (err, rental) {
      // if it isn't found, we are going to repond with 404
      if (err) {
         console.log(id + ' was not found');
         res.status(404)
      var err = new Error('Not Found');
   err.status = 404;
   res.format({
      html: function(){
               next(err);
            },
      json: function(){
               res.json({message : err.status  + ' ' + err});
            }
   });
   // if it is found we continue on
      } else {
         // uncomment this next line if you want to see every
         // JSON document response for every GET/PUT/DELETE call
         // console.log(rental);
         // once validation is done save the new item in the req
         req.id = id;
         // go to the next thing
         next(); 
      } 
   });
});

router.route('/:id')
.get(function(req, res) {
   mongoose.model('Rental').findById(req.id, function (err, rental) {
      if (err) {
         console.log('GET Error: There was a problem retrieving: ' + err);
      } else {
         console.log('GET Retrieving ID: ' + rental._id);
         // var rentaldob = rental.dob.toISOString();
         // rentaldob = rentaldob.substring(0, rentaldob.indexOf('T'))
      res.format({
         html: function(){
                  res.render('rentals/show', {
                     // "rentaldob" : rentaldob,
                     "rental" : rental
                  });
               },
         json: function(){
                  res.json(rental);
               }
      });
      }
   });
});

router.route('/:id/edit')
// GET the individual rental by Mongo ID
.get(function(req, res) {
   // search for the rental within Mongo
   mongoose.model('Rental').findById(req.id, function (err, rental) {
      if (err) {
         console.log('GET Error: There was a problem retrieving: ' + err);
      } else {
         // Return the rental
         console.log('GET Retrieving ID: ' + rental._id);
         // var rentaldob = rental.dob.toISOString();
         // rentaldob = rentaldob.substring(0, rentaldob.indexOf('T'))
      res.format({
         // HTML response will render the 'edit.jade' template
         html: function(){
                  res.render('rentals/edit', {
                     title: 'Rental' + rental._id,
                     // "rentaldob" : rentaldob,
                     "rental" : rental
                  });
               },
         // JSON response will return the JSON output
         json: function(){
                  res.json(rental);
               }
      });
      }
   });
})

// PUT to update a rental by ID
.put(function(req, res) {
   // Get our REST or form values. These rely on the "name" attributes
   // address
   var full_street_add = req.body.full_street_add;
   var street_num = req.body.street_num;
   var street_name = req.body.street_name;
   var zip_code = req.body.zip_code;
   var city = req.body.city;
   var country = req.body.country;

   // details
   var bedrooms = req.body.bedrooms;
   var bathrooms = req.body.bathrooms;
   var is_complex = req.body.is_complex;
   var stories = req.body.stories;
   var company_owned = req.body.company_owned;
   var owner = req.body.owner;

   // amenities
   var parking = req.body.parking;
   var pets = req.body.pets;
   var washer_dryer = req.body.washer_dryer;
   var pool = req.body.pool;
   var spa = req.body.spa;
   var gym = req.body.gym;
   var dishwasher = req.body.dishwasher;
   var central_air = req.body.central_air;
   var heater = req.body.heater;

   // utilites
   var gas = req.body.gas;
   var electricity = req.body.electricity;
   var trash = req.body.trash;
   var water = req.body.water;
   var tv = req.body.tv;
   var wifi = req.body.wifi;


   // find the document by ID
   mongoose.model('Rental').findById(req.id, function (err, rental) {
      // update it
      rental.update({
        address: {
          full_street_add : full_street_add,
          street_num : street_num,
          street_name : street_name,
          zip_code : zip_code,
          city : city,
          country : country
        },
        details: {
          bedrooms : bedrooms,
          bathrooms : bathrooms,
          is_complex : is_complex,
          stories : stories,
          company_owned : company_owned,
          owner : owner
        },
        amenities: {
          parking : parking,
          pets : pets,
          washer_dryer : washer_dryer,
          pool: pool,
          spa: spa,
          gym: gym,
          dishwasher: dishwasher,
          central_air: central_air,
          heater: heater
        },
        utilites: {
          gas: gas,
          electricity: electricity,
          trash: trash,
          water: water,
          tv: tv,
          wifi: wifi
        }
      }, function (err, rentalID) {
         if (err) {
            res.send("There was a problem updating the information to the database: " + err);
         } 
         else {
            // HTML responds by going back to the page or you can be
            // fancy and create a new view that shows a success page.
            res.format({
               html: function(){
                        res.redirect("/rentals/" + rental._id);
                     },
               // JSON responds showing the updated values
               json: function(){
                        res.json(rental);
                     }
            });
         }
      })
   });
})

// DELETE a Rental by ID
.delete(function (req, res){
   // find rental by ID
   mongoose.model('Rental').findById(req.id, function (err, rental) {
      if (err) {
         return console.error(err);
      } else {
         // remove it from Mongo
         rental.remove(function (err, rental) {
            if (err) {
               return console.error(err);
            } else {
               // Returning success messages saying it was deleted
               console.log('DELETE removing ID: ' + rental._id);
               res.format({
                  // HTML returns us back to the main page, or you can create a success page
                  html: function(){
                           res.redirect("/rentals");
                        },
                  // JSON returns the item with the message that is has been deleted
                  json: function(){
                           res.json({message : 'deleted',
                              item : rental
                           });
                        }
               });
            }
         });
      }
   });
});

module.exports = router;

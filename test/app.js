var request = require('superagent')
var assert = require('assert')
// var rate_my_rental = require('../RateMyRental')

describe('homepage', function(){
  it('should respond to GET', function(){
    request
      .get('http://localhost:8000')
      .end(function(res){
        expect(res.status).to.equal(200);
        done();
      })
  })
})

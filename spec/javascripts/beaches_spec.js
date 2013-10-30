//= require spec_helper
//= require beaches

describe('true', function() {
  it('should be true', function() {
    true.should.eq(true);
  });
});

describe('getGeoLocation', function() {
  it('obtains the user geolocation', function() {
    test = getGeoLocation();
    expect(test).to.not.be.a('null');
  });
});
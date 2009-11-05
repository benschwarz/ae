# "Accessibility is just a flag in the flash compilier"

Run this rack based middleware in your application, add a querystring of `?accessible=YOUR_PHONE_NUMBMER` to the URL and a Amazon mechanical turk worker (HIT) will call you to explain the image based content of the web site to you. 

## Rationale
At Edge of the web (#eotw) an Adobe representitive said the above statement, I cringed and so did a few people around the audience. 
Accessibility is far more than 'a flag' as I'm sure anyone can appreciate. (_even_ Adobe workers?)

Later, over drinks I decided that we needed a rack middleware to enable such awesome accessibility for _any_ rack powered web application.

## How to run it

Drop this rack middleware into your rails or rack based ruby application using `"run AE"`:

    use AE, :aws_access_key_id => "abc", :aws_access_key => "123", :sandbox => true

### Really? 

No. It really become tiresome listening to adobe respresentivtives blatantly pushing their anti-web bullshit on to the audience of a web based conference. 


### Dependencies

* Ruby (1.8.6+)
* Rturk (gem install rturk)
* Rack

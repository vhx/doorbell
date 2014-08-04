Twilio Doorbell
========
The door to our building is locked and we didn't want to have to send someone down to open the door for every guest. Instead we had them text a number receiving instructions on how to get in. Meanwhile, I collected all the texts that were sent and [displayed them at the party](https://gist.github.com/caseypugh/71e69bdbfad7d1dbe53d) on a [monitor](http://instagram.com/p/rK_oUzNu9r/?modal=true).

## Twilio setup
Setup a [Twilio](http://twilio.com) account. Buy a number and point the Voice and Messaging Request URLs to this app. e.g. for Messaging it'd be `http://myapp.herokuapp.com/dingdong_sms`

## Sinatra app setup
To get the local server running on `http://localhost:5000`

```
bundle install
foreman start
```

Setup your local `.env` file with the following variables. Also set these on your Heroku server via `heroku config:set TWILIO_SID=d8acix...`
```
RACK_ENV=development
TWILIO_AUTH_TOKEN=e3e781bXXXXXXXXXXXXXXXXXXXXXXXXX
TWILIO_SID=AC4c8319818724XXXXXXXXXXXXXXXXXXXX
UNICORN_BACKLOG=3
UNICORN_TIMEOUT=10
UNICORN_WORKERS=3
TWILIO_PHONE_NUMBER=+1917XXXXXX
```

## Deploying
`git push heroku master` and you're done.


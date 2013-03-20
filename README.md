# Rails lead tracker
Track signups for your landingpages in an easy way. We built the logic, you only need to customize the views and styles. It's perfect for testing an MVP or marketing some other idea.

[Owlaser Demo](http://owlaser.com)

---------------

## Starting
It's a normal rails app, start it:

    bundle install
    rake db:migrate
    rails s

--------------

## Set the following environment variables
* The domain where you will host the app **

    export VDOMAIN="localhost:3000"

** The password to access admin pages **

    export VTOKEN="mysecretpassword"

** For heroku use: **

    heroku config:add myvariable="value"

----------

## Customizing

landing.css.sass: This is where your landing page styles should go to.
home.html.slim: Your custom code for the landingpage.


## Credits
(Mark Hagethorn)[https://github.com/Malachute]
(Hendrik Kleinwaechter)[https://github.com/hendricius]

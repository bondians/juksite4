Juksite4
================

This is a web front-end "DJ" that lets users choose songs to play at parties. 
It requires cocoaJukebox.app to actually play the songs, 
and a sqlite3 file/database of all the songs, artists, &c and their locations on disk.

This application was generated with the [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) gem
provided by the [RailsApps Project](http://railsapps.github.io/).



Getting Started
---------------

Documentation and Support
-------------------------

To just run it in testing mode, use **`rails s`** from the command line.

All of the normal Ruby on Rails options are available. You can start the server 
on a specific IP address, for example, by using **` <cay> `**.
  
There are defined colors at the top of the file `framework_and_overrides.css` that 
will change the appearance of the web pages.
For example, `$TableMain:#A5B8FB;` is definition of the color used on odd-numbered table row backgrounds.
Change the hex value there and those elements will use the new color.

`$BackgroundImage:'hibiscus_blue.png';` defines the image to show in the upper-right of each page.
If the file `hibiscus_blue.png` is present in the app/assets/images/ folder, it'll be used.

Issues
-------------

Similar Projects
----------------

Contributing
------------

Credits
-------

License
-------

Problems? Issues?
-----------

Need help? Ask on Stack Overflow with the tag 'railsapps.'

Your application contains diagnostics in the README file. Please provide a copy of the README file when reporting any issues.

If the application doesn't work as expected, please [report an issue](https://github.com/RailsApps/rails_apps_composer/issues)
and include the diagnostics.

Ruby on Rails
-------------

This application requires:

- Ruby 2.2.1
- Rails 4.2.2

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

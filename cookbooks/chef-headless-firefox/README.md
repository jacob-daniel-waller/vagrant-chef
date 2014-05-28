headless-firefox Cookbook
=========================

Install and prepare firefox (or iceweasel) for cucumber testing in a headless
environment.

Inspiration from [this blog
post](http://blog.aentos.com/post/4368402854/easy-setup-for-your-cucumber-scenarios-using-the).

Requirements
------------

Currently only tested on Debian.  Should also work on other Debian flavored
distros.

Usage
-----

To get cucumber working in the selenium driver using a headless X server, xvfb:
 
1. Add ```recipe[headless-firefox]``` to your run list.  

2. Add
   
        gem 'headless'

   to your ```Gemfile``` under ```group :test```.

3. In your Cucumber settings env setup (e.g.
   ```features/support/env_custom.rb```) add:

        if ENV["SELENIUM_HEADLESS"] == 'true'
          require "headless"
          @headless = Headless.new.start
        end

License and Authors
-------------------

See [LICENSE](LICENSE).

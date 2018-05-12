<h2>Getting Started</h2> 

The whole vending machine program is executed via RSpec Tests. These tests were written in a red/green/refactor approach and should
all be in a passing green state. To run this project and see the passing tests in the terminal window, you must have both Ruby 2.1 or newer
and the gem bundler installed.

These links will provide you with the documentation to install these 2 necessary components, in the case that you do not already have both
installed on your local machine. 

Install Ruby: https://www.ruby-lang.org/en/documentation/installation/

Install Gem Bundler: http://bundler.io/

To check and see if you have Ruby installed on your local machine and to see which version is installed run:

```
ruby -v
```

Once these components are installed, you must clone this repo and save it to your local machine. Then within the terminal: 

```
cd [into folder you saved the clone of this repo]
```

Then run bundle to install the RSpec gem, which is already specified in the Gemfile of the program.

```
bundle install
```

Then once the gem install process completes, you can run the tests with this RSpec command 

```
bundle exec rspec
```

and see the 52 green dots along your terminal.

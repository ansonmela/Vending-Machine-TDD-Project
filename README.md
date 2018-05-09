# pillar_tech_vending_machine_2

Kata Description: https://github.com/PillarTechnology/kata-vending-machine

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

and see the 52 green dots along your terminal :)

<h3>Features that still must be implemented</h3>

<h4>Sold Out</h4>

`products.rb` still needs a method that can be called during the transaction process to basically subtract one from the quantity field
in the `@products` hash, upon successful completion of transaction and with the item in the `@dispenser` array ready to be popped out to customer. There also needs to be a conditional that pulls the `@products[item][1]` value and checks the quantity:
if the value `==` 0, then it must return "SOLD OUT" to the display. This needs to be hooked up to `vending_machine.rb`.

<h4>Exact Change Only</h4>

`coin_mech.rb` needs a method that tracks the amount of coins that have been pushed to the `@coin_box` variable and if `@coin_box` does not 
contain any coins, then it needs to output a message to the display "EXACT CHANGE ONLY", instead of "INSERT COIN". This needs to be hooked
up to `vending_machine.rb`.

<h5>Thanks so much for giving me a second chance on this kata! I have done my best to understand the feedback and directly applied it to my process. Looking forward to hearing from you!



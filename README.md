iBot fun project
================

This project is just4fun coding of jabber bot. You can learn from it (but I wouldn't suggest too much :-). It has
no other purpose or goal. Anyone can make a fork and add more plugins (especially people from igloonet). Just
create a pull request when you add something :-)

Prerequisites
=============

There's no good jabber library supporting MUC for ruby at the moment. So I used library based on xmpp4r which
runs only on Ruby 1.8. I tried to use 1.9 fork but I encountered problems with diacritict characters (like
ě š č ř) so only option is to run on Ruby 1.8.

This project uses bundler so you can install bundler gem and then just let it install all other gems for you.

You must also set configuration in file config.yml. You can use attached template.

Using
=====

When you want to start this bot you must run it with bundler since it uses unreleased gems directly from github.
You should start it like

``` bundle exec ./ibot.rb```

Credits
=======

Credits goes to Anežka who inspired me with her first script in Ruby to pick a barist for today. Se I tried to figure
out how to make such a script a bit more useful. Hopefully one day we'll integrate it to this bot.

Also big thanks to all guys who worked on xmpp4r, jabber-bot and jabber-mucbot libraries.

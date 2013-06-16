lagerhythm 0.2.1
==============

This is a simple Perl script which calls the Net::Twitter::Lite
library and captures text via CGI, passing along to the Twitter API.

It will also collect your GPS geolocation coordinates and upload
them as well if your browser supports it (you'll also need to enable
this in your twitter account).

In order to utilize this you'd need to create a developer account
for twitter and then obtain the various secret keys needed.

This was originally hosted on Red Hat's 'Open Shift'
(http://www.openshift.com) and used to track the frequency and location
of draft beer (pivo tocene) consumed while in the Czech Republic on work
assignment.  It is also used as a 'batphone' or alerting mechanism for people to
mobilize online (twitter -> SMS) for MMO video game raid targets I am told (nerds :)

twitter::lite CPAN module can be found below, and you'll need to use the 1.1 API:
http://search.cpan.org/~mmims/Net-Twitter-Lite/

This is released under the BSD license so do anything you want with it,
just remember to have fun.

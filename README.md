lagerhythm 0.2
==============

This is a simple Perl script which calls the twitter::lite
API and captures text via CGI then passes it along to twitter.

In order to utilize this you'd need to create a developer account
for twitter and then obtain the various secret keys needed.

This was originally hosted on Red Hat's 'Open Shift'
(http://www.openshift.com) and used to track the amount
of draft beer (pivo tocene) I consumed while in the Czech Republic
on work assignment.

It will also collect your GPS geolocation coordinates and upload
them as well if your browser supports it (you'll also need to enable
this in your twitter account).

twitter::lite CPAN module can be found here:
http://search.cpan.org/~mmims/Net-Twitter-Lite-0.12000/lib/Net/Twitter/Lite.pod

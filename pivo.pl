#!/usr/bin/perl -w
# lagerhythm 0.2
# simple perl CGI to twitter::lite
# used to track my beer consumption
# this also pulls geolocation (have to enable in twitter acct).
# https://github.com/sadsfae/lagerhythm

use CGI;

# create CGI
my $query = new CGI;

# output HTTP header
print $query->header ( );

# capture form data
my $comments = $query->param("comments");
# capture longitude, latitude
my $lat = $query->param("lat");
my $long = $query->param("long");

########### POST TO TWITTER URL ###########

use Net::Twitter::Lite;

# you need your secret tokens/keys here
my $nt = Net::Twitter::Lite->new(
  consumer_key        => 'XXXXXXXXXXXXXXXXXXXXX',
  consumer_secret     => 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
  access_token        => 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
  access_token_secret => 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
);

# post tweet, longitude and latitude
my $result = eval { $nt->update({ status => $comments, lat => $lat, long => $long }) };

warn "$@\n" if $@;

########### AUTO GENERATE HTML PAGE WHEN DONE ##########

print <<END_HTML;
<html>
<head></head>
<body>You've recorded pivo tocene!<br>
<br>Enjoy yourself, and have fun in life!</body>
</html>
END_HTML

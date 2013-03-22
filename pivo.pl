#!/usr/bin/perl -w
# lagerhythm 0.1
# simple perl CGI to twitter::lite
# used to track my beer consumption
# https://github.com/sadsfae/lagerhythm

use CGI;

# create CGI
my $query = new CGI;

# output HTTP header
print $query->header ( );

# capture form data
my $comments = $query->param("comments");

# filter form data
$comments = filter_field ( $comments );

########### POST TO TWITTER URL ###########

use Net::Twitter::Lite;

my $nt = Net::Twitter::Lite->new(
  consumer_key        => 'XXXXXXXXXXXXXXXXXXXXX',
  consumer_secret     => 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
  access_token        => 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
  access_token_secret => 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
);

my $result = eval { $nt->update($comments) };

warn "$@\n" if $@;

########### AUTO GENERATE HTML PAGE WHEN DONE ##########

print <<END_HTML;
<html>
<head></head>
<body>You've recorded pivo tocene!<br>
<br>Enjoy yourself, and have fun in life!</body>
</html>
END_HTML

# filter user input

sub filter_field
{
  my $field = shift;
  $field =~ s/From://gi;
  $field =~ s/To://gi;
  $field =~ s/BCC://gi;
  $field =~ s/CC://gi;
  $field =~ s/Subject://gi;
  $field =~ s/Content-Type://gi;
  return $field;
}

#!/usr/bin/perl -w

use CGI;

# Create the CGI object
my $query = new CGI;

# Output the HTTP header
print $query->header ( );

# Capture form results
my $comments = $query->param("comments");

# Filter form results
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

# Function for filtering user input

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

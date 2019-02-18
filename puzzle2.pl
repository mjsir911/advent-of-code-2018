#!/usr/bin/env perl


use strict;
use warnings;

while (<>) {
	#my $double_letter = $_ =~ /(\w).*\1/;
	my $triple_letter = $_ =~ /(\w).*?\1.*?\1/;
	print $triple_letter;
}

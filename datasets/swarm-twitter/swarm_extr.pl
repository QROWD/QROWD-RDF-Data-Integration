#!/usr/bin/perl

use strict;
use warnings;
use JSON::PP;

my $encoder = JSON::PP
    ->new
    ->allow_bignum(1)
    ->canonical(1)
    ->pretty(1)
    ;

my $decoder = JSON::PP
    ->new
    ->relaxed(1)
    ->allow_barekey(1)
    ->allow_singlequote(1)
    ->allow_bignum(1)
    ;

sub main {
    mkdir "../foursq_json";

    for my $input_file_name (@_) {
	warn "$input_file_name: processing...\n";

	open my   $input_file_handle  , '<:utf8', $input_file_name
	    or do { warn "$input_file_name: failed to open: $!\n"; next };

	my $data = do { local $/ ; <$input_file_handle> };

	if ($data =~ m{ fourSq.swarm.page.checkin.SwarmCheckinDetail.init\((\{.*\})\) }smx) {
	    my $match = $1;
	    $match =~ s{ \$\('.*?'\) }{1}x;

	    my $struct = $decoder->decode($match);


	    open my   $output_file_handle  , '>:utf8', "../foursq_json/${input_file_name}.json"
		or do { warn "${input_file_name}.json: failed to open: $!\n"; next };

	    print   $output_file_handle   $encoder->encode($struct);
	} else {
	    warn "$input_file_name: no data found\n";
	}
    }
}


main(@ARGV);

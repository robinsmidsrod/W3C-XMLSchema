#!/usr/bin/perl

use strict;
use warnings;
use Test::More;
use Path::Class;
use Data::Dumper qw/Dumper/;
use W3C::XMLSchema;

my @xsds = grep {/[.]xsd$/} file($0)->parent->subdir('xsds')->children;

for my $xsd (@xsds) {
    test_xsd($xsd);
}

done_testing();
exit;

sub test_xsd {
    my ($xsd) = @_;
    note $xsd;

    my $schema = eval { W3C::XMLSchema->new( file => "$xsd" ) };

    ok $schema, "$xsd gives a schema"
        or diag $@;

    return;
}

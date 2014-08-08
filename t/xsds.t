#!/usr/bin/perl

use strict;
use warnings;
use Test::More;
use Scalar::Util qw/blessed/;
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

    isa_ok $schema, 'W3C::XMLSchema', "$xsd gives a schema"
        or diag $@;

    my $tests = $xsd;
    $tests =~ s/[.]xsd$/.has/xms;
    my @tests = file($tests)->slurp;

    for my $test (@tests) {
        chomp $test;
        local $TODO;
        if ($test =~ s/^[#]//xms) {
            $TODO = "Need to get $test working";
        }
        my ($search, $value) = split /\s+/, $test, 2;
        is eval { search($schema, $search) }, $value, "\$schema->$search == $value";
    }

    return;
}

sub search {
    my ($obj, $query) = @_;

    my ($next, $rest) = split /->/, $query, 2;

    my $next_obj
        = blessed $obj && $obj->can($next) ? $obj->$next()
        : ref $obj eq 'ARRAY'              ? $obj->[$next]
        : ref $obj eq 'HASH'               ? $obj->{$next}
        :                                    die "Can't get $query from $obj\n";

    return $rest ? search($next_obj, $rest) : $next_obj;
}

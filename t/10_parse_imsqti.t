#!/usr/bin/perl

use strict;
use warnings;

use Test::More tests => 17;

BEGIN {
    use_ok( 'W3C::XMLSchema' );
}

my $qti = W3C::XMLSchema->new( file => 't/data/imsqti_v2p1.xsd' );
isa_ok($qti, 'W3C::XMLSchema');

can_ok($qti, 'target_namespace');
is($qti->target_namespace, 'http://www.imsglobal.org/xsd/imsqti_v2p1');

can_ok($qti, 'attribute_groups');
my $attr_groups = $qti->attribute_groups;
is( scalar @{ $attr_groups }, 188, 'attribute_groups count mismatch');

my $attr_group0 = $qti->attribute_groups->[0];
isa_ok($attr_group0, 'W3C::XMLSchema::AttributeGroup');
can_ok($attr_group0, 'name');
is($attr_group0->name, 'a.AttrGroup', "First attribute_group name mismatch");

can_ok($attr_group0,'attributes');
my $attributes0 = $attr_group0->attributes;
is( scalar @{ $attributes0 }, 2, 'First attribute_group attribute count mismatch');
my $attribute0_0 = $attributes0->[0];
isa_ok($attribute0_0, 'W3C::XMLSchema::Attribute');
is($attribute0_0->name, 'href', 'Attribute0_0 name mismatch');
is($attribute0_0->type, 'uri.Type', 'Attribute0_0 type mismatch');
is($attribute0_0->use, 'required', 'Attribute0_0 use mismatch');

my $attr_group1 = $qti->attribute_groups->[1];
can_ok($attr_group1, 'name');
is($attr_group1->name, 'abbr.AttrGroup', "Second attribute_group name mismatch");



1;

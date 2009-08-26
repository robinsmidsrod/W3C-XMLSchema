package W3C::XMLSchema::AttributeGroup;
use Moose;
with 'Rabbit::Node';

has 'name' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@name',
);

has 'ref' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@ref',
);

has 'attribute_groups' => (
    isa         => 'ArrayRef[W3C::XMLSchema::AttributeGroup]',
    traits      => [qw/XPathObjectList/],
    xpath_query => './xsd:attributeGroup',
);

has 'attributes' => (
    isa         => 'ArrayRef[W3C::XMLSchema::Attribute]',
    traits      => [qw/XPathObjectList/],
    xpath_query => './xsd:attribute',
);

no Moose;
__PACKAGE__->meta->make_immutable();

1;

=head1 NAME

W3C::XMLSchema::AttributeGroup - XMLSchema Attribute Group Definition


=head1 SYNOPSIS

    # Later...


=head1 DESCRIPTION

AttributeGroups, as defined by XMLSchema definition.

See L<W3C::XMLSchema> for a more complete example.


=head1 METHODS


=over 12


=item C<name>

Name given to attribute group.


=item C<ref>

Name of other AttributeGroup this attribute group references.

=item C<attribute_groups>

Child AttributeGroup of this AttributeGroup. Mostly used for referencing other AttributeGroups.


=item C<attributes>

List of attributes associated with this attribute group. Instance type L<W3C::XMLSchema::Attribute>.


=item C<new>

Standard Moose constructor.


=item C<meta>

Moose meta object.


=item C<node>

Inherited from L<Rabbit::Node>.

=item C<xpc>

Inherited from L<Rabbit::Node>.


=item C<namespace_map>

Inherited from L<Rabbit::Node>.


=back


=head1 BUGS

See L<W3C::XMLSchema/BUGS>.


=head1 SUPPORT

See L<W3C::XMLSchema/SUPPORT>.


=head1 AUTHOR

See L<W3C::XMLSchema/AUTHOR>.


=head1 COPYRIGHT

See L<W3C::XMLSchema/COPYRIGHT>.

=head1 LICENSE

See L<W3C::XMLSchema/LICENSE>.


=cut

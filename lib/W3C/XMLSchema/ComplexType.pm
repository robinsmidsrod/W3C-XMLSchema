package W3C::XMLSchema::ComplexType;
use Moose;
with 'XML::Rabbit::Node';

has 'name' => (
    traits      => ['XPathValue'],
    xpath_query => './@name',
);

has 'mixed' => (
    traits      => ['XPathValue'],
    xpath_query => './@mixed',
);

has 'items' => (
    traits      => ['XPathObjectList'],
    xpath_query => './*',
    isa_map     => {
        'xsd:group'          => 'W3C::XMLSchema::Group',
        'xsd:attributeGroup' => 'W3C::XMLSchema::AttributeGroup',
    },
);

no Moose;
__PACKAGE__->meta->make_immutable();

1;

=head1 NAME

W3C::XMLSchema::ComplexType - XMLSchema ComplexType Definition


=head1 SYNOPSIS

    # Later...


=head1 DESCRIPTION

ComplexTypes, as defined by XMLSchema definition.

See L<W3C::XMLSchema> for a more complete example.


=head1 METHODS


=over 12


=item C<name>

Name given to complex type.


=item C<mixed>

True if complex type contains mixed content.


=item C<items>

A list of items in the complex type. Instances of L<W3C::XMLSchema::Group>
or L<W3C::XMLSchema::AttributeGroup>. A ComplexType is by definition
composed of simple types, either elements or attributes.


=item C<new>

Standard Moose constructor.


=item C<meta>

Moose meta object.


=item C<node>

Inherited from L<XML::Rabbit::Node>.

=item C<xpc>

Inherited from L<XML::Rabbit::Node>.


=item C<namespace_map>

Inherited from L<XML::Rabbit::Node>.


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

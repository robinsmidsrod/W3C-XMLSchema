use strict;
use warnings;

package W3C::XMLSchema::ComplexType;
use Moose;
with 'XML::Rabbit::Node';

# ABSTRACT: XMLSchema ComplexType Definition

=attr name

Name given to complex type.

=cut

has 'name' => (
    traits      => ['XPathValue'],
    xpath_query => './@name',
);

=attr mixed

True if complex type contains mixed content.

=cut

has 'mixed' => (
    traits      => ['XPathValue'],
    xpath_query => './@mixed',
);

=attr items

A list of items in the complex type. Instances of L<W3C::XMLSchema::Group>
or L<W3C::XMLSchema::AttributeGroup>. A ComplexType is by definition
composed of simple types, either elements or attributes.

=cut

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

=head1 DESCRIPTION

ComplexTypes, as defined by XMLSchema definition.

See L<W3C::XMLSchema> for a more complete example.

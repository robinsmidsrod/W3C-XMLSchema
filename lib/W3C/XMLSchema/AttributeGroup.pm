use strict;
use warnings;

package W3C::XMLSchema::AttributeGroup;
use Moose;
with 'XML::Rabbit::Node';

# ABSTRACT: XMLSchema Attribute Group Definition

=attr name

Name given to attribute group.

=cut

has 'name' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@name',
);

=attr ref

Name of other AttributeGroup this attribute group references.

=cut

has 'ref' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@ref',
);

=attr attribute_groups

Child AttributeGroup of this AttributeGroup. Mostly used for referencing other AttributeGroups.

=cut

has 'attribute_groups' => (
    isa         => 'ArrayRef[W3C::XMLSchema::AttributeGroup]',
    traits      => [qw/XPathObjectList/],
    xpath_query => './xsd:attributeGroup',
);

=attr attributes

List of attributes associated with this attribute group. Instance type L<W3C::XMLSchema::Attribute>.

=cut

has 'attributes' => (
    isa         => 'ArrayRef[W3C::XMLSchema::Attribute]',
    traits      => [qw/XPathObjectList/],
    xpath_query => './xsd:attribute',
);

no Moose;
__PACKAGE__->meta->make_immutable();

1;

=head1 DESCRIPTION

AttributeGroups, as defined by XMLSchema definition.

See L<W3C::XMLSchema> for a more complete example.

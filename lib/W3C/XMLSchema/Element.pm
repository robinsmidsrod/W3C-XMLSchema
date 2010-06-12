use strict;
use warnings;

package W3C::XMLSchema::Element;
use Moose;
with 'XML::Rabbit::Node';

# ABSTRACT: XMLSchema Element Definition

=attr name

Name given to attribute.

=cut

has 'name' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@name',
);

=attr type

Type given of attribute.

=cut

has 'type' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@type',
);

=attr ref

Identifier of the element this element refers to.

=cut

has 'ref' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@ref',
);

=attr minOccurs

Minimum amount of occurences.

=cut

has 'minOccurs' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@minOccurs',
);

=attr maxOccurs

Maximum amount of occurences. 'unbounded' means no upper limit.

=cut

has 'maxOccurs' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@maxOccurs',
);

no Moose;
__PACKAGE__->meta->make_immutable();

1;

=head1 DESCRIPTION

Element, as defined by XMLSchema definition.

See L<W3C::XMLSchema> for a more complete example.

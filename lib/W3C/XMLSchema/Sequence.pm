use strict;
use warnings;

package W3C::XMLSchema::Sequence;
use Moose;
with 'XML::Rabbit::Node';

# ABSTRACT: XMLSchema Sequence Definition

=attr items

List of items in this sequence. Instances of L<W3C::XMLSchema::Group> or
L<W3C::XMLSchema::Element>.

=cut

has 'items' => (
    traits      => ['XPathObjectList'],
    xpath_query => './*',
    isa_map     => {
        'xsd:group'   => 'W3C::XMLSchema::Group',
        'xsd:element' => 'W3C::XMLSchema::Element',
    },
);

no Moose;
__PACKAGE__->meta->make_immutable();

1;

=head1 DESCRIPTION

Sequence, as defined by XMLSchema definition.

See L<W3C::XMLSchema> for a more complete example.

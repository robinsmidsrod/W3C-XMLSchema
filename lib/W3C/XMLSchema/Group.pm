use strict;
use warnings;

package W3C::XMLSchema::Group;
use Moose;
with 'XML::Rabbit::Node';

# ABSTRACT: XMLSchema Group Definition

=attr name

Name given to group.

=cut

has 'name' => (
    traits      => ['XPathValue'],
    xpath_query => './@name',
);

=attr ref

Name of other group this group references.

=cut

has 'ref' => (
    traits      => ['XPathValue'],
    xpath_query => './@ref',
);

=attr sequence

The sequence this group requires. Instance of L<W3C::XMLSchema::Sequence>.

=cut

has 'sequence' => (
    isa         => 'W3C::XMLSchema::Sequence',
    traits      => ['XPathObject'],
    xpath_query => './xsd:sequence',
);

no Moose;
__PACKAGE__->meta->make_immutable();

1;

=head1 DESCRIPTION

Groups, as defined by XMLSchema definition.

See L<W3C::XMLSchema> for a more complete example.

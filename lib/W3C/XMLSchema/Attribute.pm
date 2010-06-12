use strict;
use warnings;

package W3C::XMLSchema::Attribute;
use Moose;
with 'XML::Rabbit::Node';

# ABSTRACT: XMLSchema Attribute Definition

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

=attr use

If the attribute is required or not. A string with the value 'required' or 'optional';

=cut

has 'use' => (
    traits      => [qw/XPathValue/],
    xpath_query => './@use',
);

no Moose;
__PACKAGE__->meta->make_immutable();

1;

=head1 DESCRIPTION

Attribute, as defined by XMLSchema definition.

See L<W3C::XMLSchema> for a more complete example.

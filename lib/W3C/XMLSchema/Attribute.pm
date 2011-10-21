use strict;
use warnings;

package W3C::XMLSchema::Attribute;
use XML::Rabbit;

# ABSTRACT: XMLSchema Attribute Definition

=attr name

Name given to attribute.

=cut

has_xpath_value 'name' => './@name';

=attr type

Type given of attribute.

=cut

has_xpath_value 'type' => './@type';

=attr use

If the attribute is required or not. A string with the value 'required' or 'optional';

=cut

has_xpath_value 'use' => './@use';

finalize_class();
1;

__END__

=head1 DESCRIPTION

Attribute, as defined by XMLSchema definition.

See L<W3C::XMLSchema> for a more complete example.

use strict;
use warnings;

package W3C::XMLSchema::Element;
use XML::Rabbit;

# ABSTRACT: XMLSchema Element Definition

=attr name

Name given to attribute.

=cut

has_xpath_value 'name' => './@name';

=attr type

Type given of attribute.

=cut

has_xpath_value 'type' => './@type';

=attr ref

Identifier of the element this element refers to.

=cut

has_xpath_value 'ref' => './@ref';

=attr minOccurs

Minimum amount of occurences.

=cut

has_xpath_value 'minOccurs' => './@minOccurs';

=attr maxOccurs

Maximum amount of occurences. 'unbounded' means no upper limit.

=cut

has_xpath_value 'maxOccurs' => './@maxOccurs';

finalize_class();
1;

__END__

=head1 DESCRIPTION

Element, as defined by XMLSchema definition.

See L<W3C::XMLSchema> for a more complete example.

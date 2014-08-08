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

=attr min_occurs

Minimum amount of occurences.

=cut

has_xpath_value 'min_occurs' => './@minOccurs';

=attr max_occurs

Maximum amount of occurences. 'unbounded' means no upper limit.

=cut

has_xpath_value 'max_occurs' => './@maxOccurs';

=attr complex_types

A list of all the complex types defined. Instances of L<W3C::XMLSchema::ComplexType>.

=cut

has_xpath_object_list 'complex_types' => './xsd:complexType' => 'W3C::XMLSchema::ComplexType';

finalize_class();
1;

__END__

=head1 DESCRIPTION

Element, as defined by XMLSchema definition.

See L<W3C::XMLSchema> for a more complete example.

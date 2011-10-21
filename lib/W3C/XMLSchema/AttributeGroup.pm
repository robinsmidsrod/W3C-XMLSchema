use strict;
use warnings;

package W3C::XMLSchema::AttributeGroup;
use XML::Rabbit;

# ABSTRACT: XMLSchema Attribute Group Definition

=attr name

Name given to attribute group.

=cut

has_xpath_value 'name' => './@name';

=attr ref

Name of other AttributeGroup this attribute group references.

=cut

has_xpath_value 'ref' => './@ref';

=attr attribute_groups

Child AttributeGroup of this AttributeGroup. Mostly used for referencing other AttributeGroups.

=cut

has_xpath_object_list 'attribute_groups' => './xsd:attributeGroup' => 'W3C::XMLSchema::AttributeGroup';

=attr attributes

List of attributes associated with this attribute group. Instance type L<W3C::XMLSchema::Attribute>.

=cut

has_xpath_object_list 'attributes' => './xsd:attribute' => 'W3C::XMLSchema::Attribute';

finalize_class();
1;

__END__

=head1 DESCRIPTION

AttributeGroups, as defined by XMLSchema definition.

See L<W3C::XMLSchema> for a more complete example.

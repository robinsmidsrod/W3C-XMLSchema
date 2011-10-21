use strict;
use warnings;

package W3C::XMLSchema::ComplexType;
use XML::Rabbit;

# ABSTRACT: XMLSchema ComplexType Definition

=attr name

Name given to complex type.

=cut

has_xpath_value 'name' => './@name';

=attr mixed

True if complex type contains mixed content.

=cut

has_xpath_value 'mixed' => './@mixed';

=attr items

A list of items in the complex type. Instances of L<W3C::XMLSchema::Group>
or L<W3C::XMLSchema::AttributeGroup>. A ComplexType is by definition
composed of simple types, either elements or attributes.

=cut

has_xpath_object_list 'items' => './*',
    {
        'xsd:group'          => 'W3C::XMLSchema::Group',
        'xsd:attributeGroup' => 'W3C::XMLSchema::AttributeGroup',
    },
;

finalize_class();
1;

__END__

=head1 DESCRIPTION

ComplexTypes, as defined by XMLSchema definition.

See L<W3C::XMLSchema> for a more complete example.

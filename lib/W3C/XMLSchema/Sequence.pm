use strict;
use warnings;

package W3C::XMLSchema::Sequence;
use XML::Rabbit;

# ABSTRACT: XMLSchema Sequence Definition

=attr items

List of items in this sequence. Instances of L<W3C::XMLSchema::Group> or
L<W3C::XMLSchema::Element>.

=cut

has_xpath_object_list 'items' => './*',
    {
        'xsd:group'   => 'W3C::XMLSchema::Group',
        'xsd:element' => 'W3C::XMLSchema::Element',
    },
;

finalize_class();
1;

__END__

=head1 DESCRIPTION

Sequence, as defined by XMLSchema definition.

See L<W3C::XMLSchema> for a more complete example.

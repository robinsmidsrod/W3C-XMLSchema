use strict;
use warnings;

package W3C::XMLSchema::Group;
use XML::Rabbit;

# ABSTRACT: XMLSchema Group Definition

=attr name

Name given to group.

=cut

has_xpath_value 'name' => './@name';

=attr ref

Name of other group this group references.

=cut

has_xpath_value 'ref' => './@ref';

=attr sequence

The sequence this group requires. Instance of L<W3C::XMLSchema::Sequence>.

=cut

has_xpath_object 'sequence' => './xsd:sequence' => 'W3C::XMLSchema::Sequence';

finalize_class();
1;

__END__

=head1 DESCRIPTION

Groups, as defined by XMLSchema definition.

See L<W3C::XMLSchema> for a more complete example.

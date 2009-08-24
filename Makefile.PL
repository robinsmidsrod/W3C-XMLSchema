use inc::Module::Install 0.91;

name     'W3C-XMLSchema';
author   q{Robin Smidsrød <robin@smidsrod.no>};
license  'perl';
all_from 'lib/W3C/XMLSchema.pm';

requires 'Moose'  => '0.88';
requires 'Rabbit' => '0.01';

build_requires 'Test::More' => '0.88';

install_script 'xsd_structure';

repository 'git://github.com/robinsmidsrod/W3C-XMLSchema.git';

WriteAll;

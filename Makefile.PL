use inc::Module::Install;

name 'Locale-Messages-Simple';
all_from 'lib/Locale/Messages/Simple.pm';

requires 'Locale::Message';
requires 'Encode';

test_requires 'Test::More';
test_requires 'Text::Xslate';
test_requires 'POSIX';

WriteAll;

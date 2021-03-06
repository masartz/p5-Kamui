use inc::Module::Install;

all_from 'lib/Kamui.pm';
license 'perl';

requires 'Plack'                     => 0.9949;
requires 'UNIVERSAL::require';
requires 'Class::Singleton';
requires 'String::CamelCase';
requires 'Path::Class';
requires 'Encode';
requires 'File::Spec';
requires 'URI::Escape';
requires 'HTML::Entities';
requires 'HTML::FillInForm::Lite';
requires 'Class::Data::Inheritable';
requires 'Template';
requires 'Template::Stash::EscapeHTML';
requires 'Scalar::Util';
requires 'FormValidator::Lite';
requires 'JSON::XS';
requires 'Text::MicroTemplate::Extended';

test_requires 'Test::More';
test_requires 'Test::Exception';
test_requires 'Test::Output';

tests 't/*.t t/*/*.t t/*/*/*.t';
recursive_author_tests('xt');
install_script 'script/kamui.pl';

auto_install;
auto_set_repository;

WriteAll;

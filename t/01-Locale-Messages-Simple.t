use strict;
use warnings;

use Test::More;
use Text::Xslate;
use FindBin qw($Bin);
use utf8;
use POSIX qw(setlocale LC_ALL);

setlocale LC_ALL, "ru_RU.UTF-8";

subtest 'new' => sub {
    my $xs;
    eval {
        $xs =
          Text::Xslate->new( module =>
              [ "Locale::Messages::Simple" => [ "test", $Bin . "/locale" ], ] );
    };
    is $@, "", "new not failed";
    isa_ok $xs, 'Text::Xslate';
};

subtest 'translate' => sub {
    my $xs =
      Text::Xslate->new( module =>
          [ "Locale::Messages::Simple" => [ "test", $Bin . "/locale" ], ] );
    is $xs->render_string(": _('test message')"),
      "тестовое сообщение", 'translate correct';
    is $xs->render_string(": n_('file removed', 'files removed', 31)"),
      "файл удалён", 'Plural [0]';
    is $xs->render_string(": n_('file removed', 'files removed', 2)"),
      "файла удалено", 'Plural [1]';
    is $xs->render_string(": n_('file removed', 'files removed', 11)"),
      "файлов удалено", 'Plural [2]';
};

done_testing;

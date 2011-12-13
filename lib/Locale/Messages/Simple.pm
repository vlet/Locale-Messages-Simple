package Locale::Messages::Simple;
use strict;
use warnings;
use Encode;
use Locale::Messages qw(bindtextdomain dgettext dngettext);

our $VERSION = '0.010';

my $domain;
my @functions = qw(_ n_);

sub import {
    my $class = shift;
    $domain = shift;

    bindtextdomain $domain => shift;

    my $pkg = caller(0);
    no strict 'refs';
    *{ $pkg . '::' . $_ } = \&{$_} for @functions;
}

sub _($) {
    return decode_utf8( dgettext $domain, $_[0] );
}

sub n_($$$) {
    return decode_utf8( dngettext $domain, $_[0], $_[1], $_[2] );
}

1;
__END__

=head1 NAME

Locale::Messages::Simple - simple wrapper for dgettext() and dngettext() of Locale::Messages

=head1 SYNOPSIS

=head2 Simple usage

    use Locale::Messages::Simple qw('package' '/path/to/locale/dir');
    use POSIX qw( setlocale LC_MESSAGES );
    
    setlocale LC_MESSAGES, "ru_RU.UTF-8";

    print _'translated message';
    printf n_("found %d message", "found %d messages", 10), 10;


=head2 I18N for Text::Xslate template engine

    use Text::Xslate;
    use POSIX qw( setlocale  LC_MESSAGES );

    setlocale(LC_MESSAGES, 'ru_RU.UTF-8');

    my $tx = Text::Xslate->new(
        module => [
            'Locale::Messages::Simple' => ['package', '/path/to/locale/dir']
        ]);

    print $tx->render_string("<: _("message") :>");
    
    my $count = 21;
    ptrintf(
        $tx->render_string("<: n_("found %d message", "found %d messages", $count) :>"),
        $count
    );

=head1 DESCRIPTION

Locale::Messages::Simple exports _() and n_() functions as simple wrappers around
dgettext() and dngettext() of Locale::Messages those returns UTF-8 encoded strings.

=head1 AUTHOR

Vladimir Lettiev, E<lt>crux@cpan.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2011 by Vladimir Lettiev

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.2 or,
at your option, any later version of Perl 5 you may have available.

=cut

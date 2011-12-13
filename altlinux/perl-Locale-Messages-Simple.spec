Name: perl-Locale-Messages-Simple
Version: 0.010
Release: alt1
Summary: Locale::Messages::Simple - simple wrapper for dgettext() and dngettext() of Locale::Messages

Group: Development/Perl
License: Perl
Url: https://github.com/vlet/Locale-Messages-Simple

BuildArch: noarch
Source: %name-%version.tar
BuildRequires: perl-devel perl-Module-Install perl-Text-Xslate perl-libintl perl-Mouse

%description
%summary

%prep
%setup -q

%build
%perl_vendor_build

%install
%perl_vendor_install

%files
%perl_vendor_privlib/Locale/Messages/Simple.pm
%doc Changes README

%changelog
* Tue Dec 13 2011 Vladimir Lettiev <crux@altlinux.ru> 0.010-alt1
- 0.010
- initial build


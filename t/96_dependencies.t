use Test::Dependencies
    exclude => [qw( Test::Dependencies Qpsmtpd::Plugin::Queue::HTTPRequest Qpsmtpd )],
    style => 'light';

ok_dependencies();

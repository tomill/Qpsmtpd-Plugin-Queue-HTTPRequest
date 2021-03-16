# NAME

Qpsmtpd::Plugin::Queue::HTTPRequest - Email to HTTP Request

# SYNOPSIS

    # in /etc/qpsmtpd/plugins
    Qpsmtpd::Plugin::Queue::HTTPRequest
    
    # /etc/qpsmptd/que_httprequest.yaml
    handlers:
      - rcpt: '^test@example\.com'
        post: 'http://localhost/api'

# DESCRIPTION

Qpsmtpd::Plugin::Queue::HTTPRequest is a Qpsmtpd plugin that queues
a mail post as a http request.

## EXAMPLE

- /etc/qpsmtpd/plugins

        plugin_you_like_foo
        plugin_you_like_bar
        plugin_you_like_baz

        Qpsmtpd::Plugin::Queue::HTTPRequest
        
        queue/you_like

- /etc/qpsmtpd/queue\_httprequest.yaml

        handlers:
          - rcpt: 'signup-.+?@example.com'
            post: 'http://localhost/api'
          - rcpt: 'test@example\.com'
            post: 'http://localhost:3000/api'

- Email

        From: =?ISO-2022-JP?B?GyRCSVpFRBsoQg==?= <tomita@cpan.org>
        To: test api <signup-xxxyyyzzz123@example.com>
        Subject: Hello =?ISO-2022-JP?B?GyRCQCQzJhsoQg==?=
        Cc: bar@example.com, Baz <baz@example.net>
        MIME-Version: 1.0
        Content-Type: text/plain; charset="ISO-2022-JP"
        Content-Transfer-Encoding: 7bit
        
        Can you see me?
        こんにちは

    (Note: body is encoding ISO-2022-JP in practice.)

- HTTP Request

        POST 'http://localhost/api', [
            sender => 'tomita@cpan.org',
            from   => 'tomita@cpan.org',
            rcpt   => 'signup-xxxyyyzzz123@example.com',
            to     => 'signup-xxxyyyzzz123@example.com',
            cc     => 'bar@example.com',
            cc     => 'baz@example.net',
            source => <<'__EOF__'
        From: =?ISO-2022-JP?B?GyRCSVpFRBsoQg==?= <tomita@cpan.org>
        To: test api <signup-xxxyyyzzz123@example.com>
        Subject: Hello =?ISO-2022-JP?B?GyRCQCQzJhsoQg==?=
        Cc: bar@example.com, Baz <baz@example.net>
        MIME-Version: 1.0
        Content-Type: text/plain; charset="ISO-2022-JP"
        Content-Transfer-Encoding: 7bit
        
        Can you see me?
        こんにちは
        __EOF__
            ,
        ];

    (Note: source is bytes.)

# TODO

testing.. we need Qpsmtpd testing framework?

# SEE ALSO

[http://smtpd.develooper.com/](http://smtpd.develooper.com/)

similar idea: [http://www.smtp2web.com/](http://www.smtp2web.com/)

[Qpsmtpd::Plugin::EmailAddressLoose](https://metacpan.org/pod/Qpsmtpd%3A%3APlugin%3A%3AEmailAddressLoose)

# AUTHOR

Naoki Tomita <tomita@cpan.org>

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

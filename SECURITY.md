# minitar-cli Security Policy

minitar-cli aims to be secure by default. The supported commands (`create`,
`list`, and `extract`) accept input from standard input (when provided `-`) or a
filename, where the string provided is treated as a filename.

For security issues arising from the _contents_ of a tarball should be reported
for [minitar][minitar].

## Supported Versions

Security reports are accepted only for the most recent major release. As of
December 2024, that is the 1.0 release series. Older releases are no longer
supported.

## Reporting a Vulnerability

By preference, use the [Tidelift security contact][tidelift]. Tidelift will
coordinate the fix and disclosure.

Alternatively, Send an email to [minitar@halostatue.ca][email] with the text
`Minitar` in the subject. Emails sent to this address should be encrypted using
[age][age] with the following public key:

```
age1fc6ngxmn02m62fej5cl30lrvwmxn4k3q2atqu53aatekmnqfwumqj4g93w
```

[minitar]: https://github.com/halostatue/minitar
[tidelift]: https://tidelift.com/security
[email]: mailto:minitar@halostatue.ca
[age]: https://github.com/FiloSottile/age
[CVE-2017-17405]: https://nvd.nist.gov/vuln/detail/CVE-2017-17405
[openuri]: https://sakurity.com/blog/2015/02/28/openuri.html

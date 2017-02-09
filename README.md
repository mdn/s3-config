# MDN S3 Configuration

[MDN](https://developer.mozilla.org) publishes files on Amazon's
[Simple Storage Service](https://aws.amazon.com/s3/) (S3).  This
repository contains the configuration files for S3 and utilities
for updating S3 when they change.

## Requirements

[s3cmd](http://s3tools.org/s3cmd) is required for using the utilities.  It
can be manually installed from the
[download page](http://s3tools.org/download), or installed with a package
manager like [Homebrew](http://brew.sh) (``brew install s3cmd``).

[GnuPG](https://gnupg.org) can optionally be used by s3cmd to encrypt files as
they are transmitted to AWS.

To access the MDN S3 buckets, you'll need an AWS access key and secret key
for the MDN account. You can create a configuration file with values at
``~/.s3cfg`` by running ``s3cmd --configure``.

To test your configuration, run ``s3cmd ls``.  You should get a list of the
S3 buckets on the Mozilla account.

## Buckets

MDN uses these buckets:

* ``mdn-downloads``: Files for development, such as the sample database and
  the full MDN scrape, that are periodically updated. Accessible at
  http://mdn-downloads.s3-website-us-west-2.amazonaws.com/ and
  https://mdn-downloads.s3-us-west-2.amazonaws.com/index.html.

## Utilities

A Makefile provides helpful commands for updating the buckets:

* ``make upload``: Upload the "static website" files to the S3 bucket.
* ``make open``: Open the static website in a browser
* ``make setpolicy``: Set the bucket public access policy
* ``make setcors``: Set the bucket CORS settings

The default bucket is ``mdn-downloads``, but can be customized, such as
``make open BUCKET=mdn-test-bucket``.

## License

``buckets/mdn-downloads/assets/js/list.js`` is originally from
[rufuspollack/s3-bucket-listing](https://github.com/rufuspollock/s3-bucket-listing),
Copyright 2012-2015 Rufus Pollack, used under the MIT license.

The remaining files are licensed under Mozilla Public License Version 2.0.

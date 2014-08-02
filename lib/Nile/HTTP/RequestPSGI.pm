#	Copyright Infomation
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#	Module	:	Nile::HTTP::RequestPSGI
#	Author		:	Dr. Ahmed Amin Elsheshtawy, Ph.D.
#	Website	:	https://github.com/mewsoft/Nile, http://www.mewsoft.com
#	Email		:	mewsoft@cpan.org, support@mewsoft.com
#	Copyrights (c) 2014-2015 Mewsoft Corp. All rights reserved.
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
package Nile::HTTP::RequestPSGI;

our $VERSION = '0.31';

=pod

=encoding utf8

=head1 NAME

Nile::HTTP::RequestPSGI -  The HTTP request manager.

=head1 SYNOPSIS
	
	# get app context
	$app = $self->me;

	# get request instance which extends CGI::Simple
	$request = $app->request;

	$email = $request->param("email");

	$value = $request->cookie("username");

=head1 DESCRIPTION

Nile::HTTP::RequestPSGI -  The HTTP request manager.

The http request is available as a shared object extending the L<CGI::Simple> module. This means that all methods supported
by L<CGI::Simple> is available with the additions to these few methods:

	is_ajax
	is_post
	is_get
	is_head
	is_put
	is_delete
	is_patch

You access the request object by $self->me->request.

=cut

use Nile::Base;
use MooseX::NonMoose;
extends 'Nile::HTTP::PSGI';

#Methods: HEAD, POST, GET, PUT, DELETE, PATCH
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sub is_ajax {
	(exists $ENV{HTTP_X_REQUESTED_WITH} && lc($ENV{HTTP_X_REQUESTED_WITH}) eq 'xmlhttprequest')? 1 : 0;
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sub is_post {lc(shift->request_method) eq "post";}
sub is_get {lc(shift->request_method) eq "get";}
sub is_head {lc(shift->request_method) eq "head";}
sub is_put {lc(shift->request_method) eq "put";}
sub is_delete {lc(shift->request_method) eq "delete";}
sub is_patch {lc(shift->request_method) eq "patch";}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sub object {
	my $self = shift;
	$self->me->object(__PACKAGE__, @_);
}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

=pod

=head1 Bugs

This project is available on github at L<https://github.com/mewsoft/Nile>.

=head1 HOMEPAGE

Please visit the project's homepage at L<https://metacpan.org/release/Nile>.

=head1 SOURCE

Source repository is at L<https://github.com/mewsoft/Nile>.

=head1 SEE ALSO

See L<Nile> for details about the complete framework.

=head1 AUTHOR

Ahmed Amin Elsheshtawy,  احمد امين الششتاوى <mewsoft@cpan.org>
Website: http://www.mewsoft.com

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2014-2015 by Dr. Ahmed Amin Elsheshtawy احمد امين الششتاوى mewsoft@cpan.org, support@mewsoft.com,
L<https://github.com/mewsoft/Nile>, L<http://www.mewsoft.com>

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

=cut

1;
#!/usr/bin/env perl

use warnings;
#____________________________________________________________________________
#
#   MusicBrainz -- the open internet music database
#
#   Copyright (C) 1998 Robert Kaye
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#
#   $Id$
#____________________________________________________________________________

package DBDefs;
use parent 'DBDefs::Default';
use MusicBrainz::Server::Replication ':replication_type';
use MusicBrainz::Server::DatabaseConnectionFactory;

################################################################################
# Directories
################################################################################
sub MB_SERVER_ROOT    { "{{ musicbrainz_install_directory }}" }

################################################################################
# The Database
################################################################################
MusicBrainz::Server::DatabaseConnectionFactory->register_databases(
    READWRITE => {
        database    => "{{ musicbrainz_db_name }}",
        username    => "{{ musicbrainz_db_username }}",
        password        => "{{ musicbrainz_db_password }}",
#       host            => "",
#       port            => "",
    },
    READONLY => {
        database    => "{{ musicbrainz_db_name }}",
        username    => "{{ musicbrainz_db_username }}",
        password        => "{{ musicbrainz_db_password }}",
#       host            => "",
#       port            => "",
    },
    SYSTEM    => {
        database    => "template1",
        username    => "postgres",
#       password        => "",
#       host            => "",
#       port            => "",
    },
);

sub DB_SCHEMA_SEQUENCE { 22 }
sub REPLICATION_TYPE { RT_SLAVE }
sub REPLICATION_ACCESS_TOKEN { "{{ musicbrainz_replication_access_token }}" }

################################################################################
# HTTP Server Names
################################################################################
sub WEB_SERVER                { "{{ musicbrainz_hostname }}" }
# sub LUCENE_SERVER             { "search.musicbrainz.org" }

################################################################################
# Server Settings
################################################################################
sub MUSICBRAINZ_USE_PROXY {"{{ 1 | int if musicbrainz_include_nginx else 0 | int }}"}
sub DB_STAGING_SERVER { 0 }
sub DEVELOPMENT_SERVER { 0 }
sub CATALYST_DEBUG { 0 }

sub RENDERER_HOST { 'not.in.use' }
sub RENDERER_PORT { 9009 }

1;

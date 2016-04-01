Ansible *MusicBrainz Mirror-Server* Role
========================================

A minimal Ansible role that installs and configureas a minimal [MusicBrainz](http://musicbrainz.org/) mirror-server.

The setup here only aims to provide mirrored/local access to the MusicBrainz API (a.k.a. Web-Service). The web-frontend it self however
is included, but not treated with too much love...


Requirements
------------

 - Debian 8.x
   + Debian < 8.x: We don't have any reasons to support older versions. Most things actually should work fine, but `wheezy`does not include `nodejs`/`npm`
   + ubuntu: Should/could work as well, but has never been tested.

 - The instance used to deploy to must have at least **25GB** of free disk space (for replication-data).
 - Patience. Running this role for the first time (and having the replication-data loaded) will take ine to two hours.
   (even longer on a slow uplink, as the required dumps are 2GB+)

Role Variables
--------------

- `musicbrainz_include_common`: tbd
- `musicbrainz_hostname`: tbd
- `musicbrainz_include_nginx`: tbd
- `musicbrainz_include_replication`: install the replication scripts


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: mb-mirrors
      roles:
         - { role: hzlf.musicbrainz-mirror, musicbrainz_replication_access_token: "****" }


License
-------

BSD

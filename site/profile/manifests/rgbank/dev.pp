class profile::rgbank::dev (
  $ensure = undef,
  $source = undef,
  $revision = undef,
) {

  Vcsrepo <| tag == 'rgbank::web' |> {
    ensure   => $ensure,
    source   => $source,
    revision => $revision,
    force    => true,
  }

}

# Copyright 2025. Puppet, Inc., a Perforce company.
#
# @summary A plan to run spec tests locally on each node.
# @param targets The targets to run on.
# @param spec The spec file to run. This must be a file in the spec/localhost directory.
plan teched_lab_tests::run_local_spec (
  TargetSpec $targets = 'localhost',
  String $spec,                           # A spec file in the spec/localhost/ directory
) {
  $spec_dir = 'spec/localhost'
  $spec_path = "${spec_dir}/${spec}"

  run_task('teched_lab_tests::install_ruby', $targets)
  run_task('teched_lab_tests::install_pdk', $targets)
  run_task('teched_lab_tests::bundle_install', $targets)
  run_task('teched_lab_tests::run_localhost_test', $targets, 'spec' => $spec)
}

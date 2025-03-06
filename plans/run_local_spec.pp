# Copyright 2025. Puppet, Inc., a Perforce company.
#
# @summary A plan to run spec tests locally on each node.
# @param targets The targets to run on.
# @param spec_file The spec file to run.
plan teched_lab_tests::run_local_spec (
  TargetSpec $targets = 'localhost',
  String $spec_file,                      # A spec file in the spec/localhost/ directory
) {
  $spec_dir = 'spec/localhost'
  $spec_path = "${spec_dir}/${spec_file}"

  run_task('install_ruby', $targets)
  run_task('install_pdk', $targets)
  run_task('bundle_install', $targets)
  run_task('run_local_spec', $targets, 'spec_file' => $spec_file)
}

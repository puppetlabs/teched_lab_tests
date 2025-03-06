# This is the structure of a simple plan. To learn more about writing
# Puppet plans, see the documentation: http://pup.pt/bolt-puppet-plans

# The summary sets the description of the plan that will appear
# in 'bolt plan show' output. Bolt uses puppet-strings to parse the
# summary and parameters from the plan.
# @summary A plan to run spec tests locally on each node.
# @param targets The targets to run on.
# @param spec_file The spec file to run.
plan teched_lab_tests::run_local_spec (
  TargetSpec $targets = 'localhost',
  String $spec_file,                      # A spec file in the spec/localhost/ directory
) {
  $spec_dir = 'spec/localhost'
  $spec_path = "${spec_dir}/${spec_file}"
  if ! file::exists($spec_path) {
    fail("Spec file '${spec_file}' not found in '${spec_dir}'")
  }
  run_task('install_ruby', $targets)
  run_task('install_pdk', $targets)
  run_task('bundle_install', $targets)
  run_task('run_local_spec', $targets, 'spec_file' => $spec_file)
}

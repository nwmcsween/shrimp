% FIXTURES: "$SHELLSPEC_HELPERDIR/fixtures"

Describe 'file.sh'
  Before SHELLSPEC_LOAD_PATH="$FIXTURES"
  Include ./file.sh
  Describe 'fl_tmp'
    It 'supresses stderr with -q switch'
      When run fl_tmp -q /dev/null
      The status should be failure
    End
    It 'adds a suffix with -s switch'
      When run fl_tmp -s '.c'
      The stdout should end with ".c"
      The status should be success
    End
    It 'outputs help info with -h switch'
      When run fl_tmp -h
      The stdout should start with "Usage"
      The status should be success
    End
    It 'fails if given an invalid directory'
      When run fl_tmp /dev/null
      The stderr should equal "\$1 with value /dev/null isn't a valid directory"
      The status should be failure
    End
    It 'creates a temparary file and succeeds with no args'
      When run fl_tmp
      The stdout should start with "/tmp/"
      The status should be success
    End
  End
End

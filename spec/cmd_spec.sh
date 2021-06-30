% FIXTURES: "$SHELLSPEC_HELPERDIR/fixtures"

Describe 'cmd.sh'
  Before SHELLSPEC_LOAD_PATH="$FIXTURES"
  Include ./cmd.sh
  Describe 'cmd_exists'
    It 'succeeds on a valid command'
      When call cmd_exists "["
      The status should be success
    End
    It 'fails on an invalid command'
    #  When call cmd_exists "/dev/null"
    #  The status should be failure
    End
  End
End

% FIXTURES: "$SHELLSPEC_HELPERDIR/fixtures"

Describe 'process.sh'
  Before SHELLSPEC_LOAD_PATH="$FIXTURES"
  Include ./process.sh
  Describe 'pr_dosh'
    It 'retries 6 times given arg'
      When call pr_dosh -r 6 "$FIXTURES/failure.sh"
      The stdout should match pattern "*failure.sh"
      The status should equal 2
    End
  End
End

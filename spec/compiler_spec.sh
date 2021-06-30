% FIXTURES: "$SHELLSPEC_HELPERDIR/fixtures"

Describe 'compiler.sh'
  before() {
    . $SHELLSPEC_PROJECT_ROOT/file.sh
    export SHELLSPEC_LOAD_PATH="$FIXTURES"
    tmp=$(fl_tmp -s .c)
  }
  after() {
    rm -rf $tmp
  }
  BeforeAll 'before'
  AfterAll 'after'
  Include ./compiler.sh
  Describe 'cc_is_pp'
    It 'succeeds when given a valid preprocessor symbol'
      When run cc_is_pp '__GNUC__' "$tmp"
      The status should be success
    End
    It 'fails when given an invalid preprocessor symbol'
      When run cc_is_pp 'FOOBAR' "$tmp"
      The status should be failure
    End
  End
  Describe 'cc_is_flag'
    It 'succeeds when given a valid flag'
      When run cc_is_flag '-Wall' "$tmp"
      The status should be success
    End
    It 'fails when given an invalid flag'
      When run cc_is_flag '-null' "$tmp"
      The status should be failure
    End
  End
End

return {
  -- {{{ <pre> print_r log
  s( { trig = "pre", dscr = "print_r between <pre> tags" },
    fmt(
        [[
        echo "<pre>" . print_r( "{} : " . ${}, true ) . "</pre>";{}
        ]],
      {
        i(1),
        i(2),
        i(0),
      }
    )
  ),
  -- }}}
  -- {{{ <pre> var_dump log
  s( { trig = "dump", dscr = "var_dump between <pre> tags" },
    fmt(
        [[
        echo "<pre>" . var_dump( "{} : " . ${} ) . "</pre>";{}
        ]],
      {
        i(1),
        i(2),
        i(0),
      }
    )
  ),
  -- }}}
  -- {{{ error_log log
  s( { trig = "l", dscr = "error_log" },
    fmt(
        [[
        error_log( "{} : " . print_r( ${}, true ) );{}
        ]],
      {
        i(1),
        i(2),
        i(0),
      }
    )
  ),
  -- }}}
  -- {{{ query monitor log
  -- s( { trig = "m", dscr = "query monitor log" },
  --   fmt(
  --       [[
  --       do_action( 'qm/notice', print_r( ${}, true ) );{}
  --       ]],
  --     {
  --       i(1),
  --       i(2),
  --       i(0),
  --     }
  --   )
  -- )
  -- }}}
}

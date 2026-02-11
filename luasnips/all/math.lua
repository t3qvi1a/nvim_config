return {
  -- Example: how to set snippet parameters
  s(
    { -- Table 1: snippet parameters
      trig="hi",
      dscr="An autotriggering snippet that expands 'hi' into 'Hello, world!'",
      regTrig=false,
      priority=100,
      -- snippetType="autosnippet"
    },
    { -- Table 2: snippet nodes (don't worry about this for now---we'll cover nodes shortly)
      t("Hello, world!"), -- A single text node
    }
    -- Table 3, the advanced snippet options, is left blank.
  ),

    s({trig=";a", snippetType="autosnippet"},
      {
        t("\\alpha"),
      }
    ),
    s({trig=";b", snippetType="autosnippet"},
      {
        t("\\beta"),
      }
    ),
    s({trig=";g", snippetType="autosnippet"},
      {
        t("\\gamma"),
      }
    ),
    s({trig = "lines", dscr = "Demo: a text node with three lines."},
      {
        t({"Line 1", "Line 2", "Line 3"})
      }
    ),

    s({trig="ff", dscr="Expands 'ff' into '\frac{}{}'", snippetType="autosnippet"},
      {
        t("\\frac{"),
        i(1),  -- insert node 1
        t("}{"),
        i(2),  -- insert node 2
        t("}")
      }
    ),
  
}

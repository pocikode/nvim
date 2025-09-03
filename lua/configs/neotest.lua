local neotest_golang_opts = {
  runner = "go",
  go_test_args = {
    "-v",
    "-race",
    "-count=1",
  },
}

require("neotest").setup {
  adapters = {
    require "neotest-golang"(neotest_golang_opts),
  },
}

require(['codemirror/keymap/vim'], function() {
  // Map jj to <Esc>
  CodeMirror.Vim.map("jj", "<Esc>", "insert");
  // Use gj/gk instead of j/k
  CodeMirror.Vim.map("j", "gj", "normal");
  CodeMirror.Vim.map("k", "gk", "normal");
});

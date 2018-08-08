// this script is ran when page is loaded
//   http://jupyter-notebook.readthedocs.io/en/latest/examples/Notebook/JavaScript%20Notebook%20Extensions.html#custom.js
//   http://blog.rtwilson.com/how-to-get-sublime-text-style-editing-in-the-ipythonjupyter-notebook/

require([
  'codemirror/keymap/sublime',
  'notebook/js/cell',
  'base/js/namespace',
], (sublime_keymap, cell, IPython) => {
  cell.Cell.options_default.cm_config.keyMap = 'sublime';

  if (IPython.notebook) {
    IPython.notebook
      .get_cells()
      .forEach(cell => cell.code_mirror.setOption('keyMap', 'sublime'));
  } else {
    console.warn('IPython.notebook is undefined');
  }
});

// SUBLIME KEYMAPS (macOS):
// * `cmd-d`: expand selection by current selected word
// * `ctrl-cmd-up`: move line up

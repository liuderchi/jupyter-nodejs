// this script is ran when page is loaded
//   http://jupyter-notebook.readthedocs.io/en/latest/examples/Notebook/JavaScript%20Notebook%20Extensions.html#custom.js
//   http://blog.rtwilson.com/how-to-get-sublime-text-style-editing-in-the-ipythonjupyter-notebook/

// TODO custom config object

const EnableCodeSandboxIframe = true

require([
  'codemirror/keymap/sublime',
  'notebook/js/cell',
  'base/js/namespace',
], (sublime_keymap, cell, IPython) => {
  // default config: cell.Cell.options_default.cm_config

  if (IPython.notebook) {
    IPython.notebook.get_cells().forEach(cell => {
      cell.code_mirror.setOption('keyMap', 'sublime');
      cell.code_mirror.setOption('indentUnit', 2);
    });
  } else {
    console.warn('IPython.notebook is undefined');
  }

  if (EnableCodeSandboxIframe) {
    window.html4.ATTRIBS['iframe::src'] = 0;
    window.html4.ATTRIBS['iframe::sandbox'] = 0;
  }
});

// SUBLIME KEYMAPS (macOS):
// * `cmd-d`: expand selection by current selected word
// * `ctrl-cmd-up`: move line up

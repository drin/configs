// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.

module.exports = {
  // format: [@org/]project[#version]
  plugins     : ['hyper-native-window-decoration', "hyper-monokai-extended"],

  // directory under `~/.hyper_plugins/local/` to load without being `npm install`ed
  localPlugins: [],

  keymaps     : {
    "pane:prev"     : "alt+k",
    "pane:next"     : "alt+j",
    "plugins:update": "alt+shift+u",
  },

  config      : {
    // 'stable' | 'canary'
    updateChannel     : 'canary',

    // font family with optional fallbacks
    fontFamily        : '"Fira Mono", "DejaVu Sans Mono", consolas, "Lucida Console", monospace',
    fontSize          : 12,

    // 'normal' | 'bold'
    fontWeight        : 'normal',
    fontWeightBold    : 'bold',

    // 'BEAM', 'UNDERLINE', 'BLOCK': |, _, █
    cursorShape       : 'BLOCK',
    cursorBlink       : false,

    cursorColor       : 'rgba(248,28,229,0.8)',
    cursorAccentColor : '#000',

    foregroundColor   : '#fff',
    backgroundColor   : '#222',
    selectionColor    : 'rgba(248,28,229,0.3)',
    borderColor       : '#333',

    css               : '',
    termCSS           : '',
    padding           : '0px',

    showHamburgerMenu : false,
    showWindowControls: false,

    shell             : '',
    shellArgs         : ['--login'],
    env               : {},

    bell              : false,

    // right-click pastes, or copies (moot if copyOnSelect is True)
    quickEdit         : true,
    copyOnSelect      : true,
    defaultSSHApp     : true,

    opacity           : 0.7,
  },

  // the full list. if you're going to provide the full color palette,
  // including the 6 x 6 color cubes and the grayscale map, just provide
  // an array here instead of a color map object
  colors: {
    black       : '#000000',
    red         : '#C51E14',
    green       : '#1DC121',
    yellow      : '#C7C329',
    blue        : '#0A2FC4',
    magenta     : '#C839C5',
    cyan        : '#20C5C6',
    white       : '#C7C7C7',
    lightBlack  : '#686868',
    lightRed    : '#FD6F6B',
    lightGreen  : '#67F86F',
    lightYellow : '#FFFA72',
    lightBlue   : '#6A76FB',
    lightMagenta: '#FD7CFC',
    lightCyan   : '#68FDFE',
    lightWhite  : '#FFFFFF',
  },
};

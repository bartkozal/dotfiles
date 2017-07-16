module.exports = {
  config: {
    bell: false,
    borderColor: "#202121",
    colors: {
      black: "#202121",
      red: "#f73e2a",
      green: "#59ff1a",
      yellow: "#f7dd72",
      blue: "#00a8ff",
      magenta: "#f746ff",
      cyan: "#1effff",
      white: "#fff",
      lightBlack: "#202121",
      lightRed: "#f73e2a",
      lightGreen: "#59ff1a",
      lightYellow: "#f7dd72",
      lightBlue: "#00a8ff",
      lightMagenta: "#f746ff",
      lightCyan: "#1effff",
      lightWhite: "#fff",
    },
    cursorBlink: true,
    cursorColor: "#f5bb3d",
    cursorShape: "UNDERLINE",
    fontSize: 14,
    fontFamily: "'Roboto Mono', monospace",
    padding: "6px",
    termCSS: `
      x-screen a {
        color: #1effff;
      }

      x-screen a.hover {
        text-decoration: underline;
      }
    `,
  },
  plugins: [
    "hyper-blink",
    "hyper-search",
    "hyper-statusline",
    "hypercwd",
    "hyperlinks",
    "hyperterm-alternatescroll",
    "hyperterm-paste",
  ],
  localPlugins: [],
};

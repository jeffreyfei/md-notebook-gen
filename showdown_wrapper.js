const showdown  = require('showdown');
const showdownHighlight = require("showdown-highlight");

let text = process.argv[2]


converter = new showdown.Converter({
  ghCompatibleHeaderId: true,
  simpleLineBreaks: true,
  ghMentions: true,
  tables: true,
  extensions: [showdownHighlight]
});

html = converter.makeHtml(text)

console.log(html)

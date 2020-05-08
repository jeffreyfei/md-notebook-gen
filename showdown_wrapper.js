var showdown  = require('showdown');

let text = process.argv[2]


converter = new showdown.Converter({
  ghCompatibleHeaderId: true,
  simpleLineBreaks: true,
  ghMentions: true,
  tables: true
});

html = converter.makeHtml(text)

console.log(html)

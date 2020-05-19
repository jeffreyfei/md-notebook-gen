# Markdown to HTML Docs Converter

- Recursively converts a Markdown documentation to HTML pages with the
same directory structure
- Converter implementation is a wrapper around [showdownjs](https://github.com/showdownjs/showdown)
- Credits to [KrauseFx/markdown-to-html-github-style](https://github.com/KrauseFx/markdown-to-html-github-style) for providing the stylesheet
- Syntax highlighting enabled by [highlight.js](https://highlightjs.org/)

## Usage

Get dependencies
```
npm install
```

Generate HTML notebook
```
./generate_notebook.sh <input_dir>
```

Convert individual Markdown file to HTML
```
./convert_html.sh <input_file> <output_file>
```

- Default output directory is `output/`

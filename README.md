# Markdown to HTML Docs Converter

- Recursively converts a Markdown documentation to HTML pages with the
same directory structure
- Converter implementation is a wrapper around [showdownjs](https://github.com/showdownjs/showdown)
- Credits to [KrauseFx/markdown-to-html-github-style](https://github.com/KrauseFx/markdown-to-html-github-style) for providing the stylesheet

## Usage

Get dependencies
```
npm install
```

Generate HTML notebook
```
./convert_notebook.sh <input_dir>
```

- Default output directory is `output/`

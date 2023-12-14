// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
const vscode = require("vscode");
const path = require("path");
const fs = require("fs");
/**
 * @type {Object.<string, string>}
 */
const allFunctionNames = Object.assign(
  {},
  Object.fromEntries(
    fs
      .readFileSync(path.join(__dirname, "symbols", "names.txt"), "utf8")
      .split(" ")
      .map((x) => [x, "None"])
  ),
  ...fs
    .readdirSync(path.join(__dirname, "symbols"))
    .filter((x) => x.startsWith("symbols") && x.endsWith(".json"))
    .map((name) =>
      JSON.parse(
        fs.readFileSync(path.join(__dirname, "symbols", name), "utf8") || "{}"
      )
    )
);
// This method is called when your extension is activated
// Your extension is activated the very first time the command is executed
/**
 * @param {vscode.ExtensionContext} context
 */
function activate(context) {
  context.subscriptions.push(
    vscode.languages.registerCompletionItemProvider(
      { scheme: "file", language: "wolfram" },
      {
        provideCompletionItems(document, position, token, context) {
          // return all completion items as array
          return Object.entries(allFunctionNames).map(([name, desc]) => {
            const c = new vscode.CompletionItem(
              name,
              vscode.CompletionItemKind.Function
            );
            c.insertText = name;
            c.documentation = desc;
            return c;
          });
        },
      }
    ),
    vscode.languages.registerHoverProvider(
      { scheme: "file", language: "wolfram" },
      {
        provideHover(document, position, token) {
          return new vscode.Hover(
            "```mma\n" +
              (allFunctionNames[
                document.getText(
                  // this regex do a loose match, only check the first is UPPER and ignore others.
                  document.getWordRangeAtPosition(position, /[A-Z][`\$A-z]*/)
                )
              ] || "") +
              "\n```"
          );
        },
      }
    )
  );
}

// This method is called when your extension is deactivated
function deactivate() {}

module.exports = {
  activate,
  deactivate,
};

// The module 'vscode' contains the VS Code extensibility API
// Import the module and reference it with the alias vscode in your code below
const vscode = require("vscode");
const path = require("path");
const fs = require("fs");

const allFunctionNames = fs.readFileSync(
  path.join(__dirname, "symbols.txt"),
  "utf8"
);
// This method is called when your extension is activated
// Your extension is activated the very first time the command is executed
/**
 * @param {vscode.ExtensionContext} context
 */
function activate(context) {
  context.subscriptions.push(
    vscode.languages.registerCompletionItemProvider("wolfram", {
      provideCompletionItems(document, position, token, context) {
        // return all completion items as array
        return allFunctionNames.split("\n").map((x) => {
          let c = new vscode.CompletionItem(
            x,
            vscode.CompletionItemKind.Function
          );
          c.insertText = x;
          return c;
        });
      },
    })
  );
}

// This method is called when your extension is deactivated
function deactivate() {}

module.exports = {
  activate,
  deactivate,
};

module.exports =
  activate: ->
    atom.commands.add 'atom-workspace',
      "critic-markup:addition": =>
        @addition()
      "critic-markup:deletion": =>
        @deletion()
      "critic-markup:substitution": =>
        @substitution()
      "critic-markup:comment": =>
        @comment( )
      "critic-markup:highlight": =>
        @highlight()

  addition: ->
    editor = atom.workspace.getActivePaneItem()
    selection = editor.getLastSelection()
    text = selection.getText()
    editor.insertText("{++"+text+"++}")
    if !text
        editor.moveLeft(3)

  deletion: ->
    editor = atom.workspace.getActivePaneItem()
    selection = editor.getLastSelection()
    text = selection.getText()
    editor.insertText("{--"+text+"--}")
    if !text # strange but possible case
        editor.moveLeft(3)

  substitution: ->
    editor = atom.workspace.getActivePaneItem()
    selection = editor.getLastSelection()
    text = selection.getText()
    editor.insertText("{~~"+text+"~>~~}")
    editor.moveLeft(3)

  comment: ->
    editor = atom.workspace.getActivePaneItem()
    selection = editor.getLastSelection()
    text = selection.getText()
    editor.insertText("{>>"+text+"<<}")
    if !text
        editor.moveLeft(3)

  highlight: ->
    editor = atom.workspace.getActivePaneItem()
    selection = editor.getLastSelection()
    text = selection.getText()
    editor.insertText("{=="+text+"==}{>><<}")
    editor.moveLeft(3)

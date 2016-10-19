json.partial! "notebook", notebook: @notebook
json.notes @notebook.notes, partial: "notes/note", as: :note

//= require turbolinks
//= require_tree .

import "@hotwired/turbo-rails";
import "controllers";

document.addEventListener("turbo:load", function () {
  const notepadTextarea = document.getElementById("notepad");

  notepadTextarea.addEventListener("input", function () {
    const content = notepadTextarea.value;

    current_user.note_content = content;

    const saveNoteButton = document.getElementById("saveNote");
    saveNoteButton.textContent = content ? "Update" : "Save";
  });
});

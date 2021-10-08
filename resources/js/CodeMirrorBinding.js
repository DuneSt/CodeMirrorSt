let cMirrorBinding

class CMirrorBinding {

  constructor() {
    this.editorsMaps = new WeakMap()
  }

  initEditors() {
    const containers = document.querySelectorAll(".cmirror-container")
    for (let container of containers) {
      let editorElement = container.getElementsByClassName("cmirror-container-editor")[0]
      editorElement.innerHTML = ""
      let editor = CodeMirror(document.body, {
        value: editorElement.dataset.code,
        mode:  editorElement.dataset.language || "markdown"
      })
      this.editorsMaps.set(container, editor)
    }
  }

  static getContentFor(saveButtonElement) {
  }

  static save(saveButtonElement) {
    document.body.style.cursor = "progress"
    saveButtonElement.style.cursor = "not-allowed"
    return this.getContentFor(saveButtonElement)
  }

  static saveCompleted(saveButtonElement) {
    document.body.style.cursor = "default"
    saveButtonElement.style.cursor = "default"
  }

  static saveFailed(saveButtonElement) {
    document.body.style.cursor = "default"
    saveButtonElement.style.cursor = "default"
  }

}

class CMirrorBinding {
  static instance

  static initEditors() {
    CMirrorBinding.getInstance().initEditors()
  }

  static getInstance() {
    if(!CMirrorBinding.instance) {
      CMirrorBinding.instance = new CMirrorBinding()
    }
    return CMirrorBinding.instance
  }

  constructor() {
    this.editorsMaps = new WeakMap()
  }

  initEditors() {
    const containers = document.querySelectorAll(".cmirror-container")
    for (let container of containers) {
      let editorElement = container.getElementsByClassName("cmirror-container-editor")[0]
      editorElement.innerHTML = ""
      let editor = CodeMirror(editorElement, {
        value: editorElement.dataset.code || " ",
        mode:  editorElement.dataset.language || "markdown"
      })
      this.editorsMaps.set(container, editor)
    }
  }

  getContentFor(containerElement) {
    let editor = this.editorsMaps.get(containerElement)
    if(editor) {
      return editor.getValue()
    } else {
      console.error(new Error("editor not found"), {containerElement})
    }
  }

  static getValue(containerElement) {
    CMirrorBinding.getInstance().getContentFor(containerElement)
  }

  static save(id) {
    document.body.style.cursor = "progress"
    let saveButtonElement = document.getElementById(id +"-save")
    if(saveButtonElement){
      saveButtonElement.style.cursor = "not-allowed"
    }
    return CMirrorBinding.getInstance().getContentFor(document.getElementById(id))
  }

  static saveCompleted(id) {
    document.body.style.cursor = "default"
    let saveButtonElement = document.getElementById(id +"-save")
    if(saveButtonElement) {
      saveButtonElement.style.cursor = "default"
    }
  }

  static saveFailed(id) {
    document.body.style.cursor = "default"
    let saveButtonElement = document.getElementById(id +"-save")
    if(saveButtonElement) {
      saveButtonElement.style.cursor = "default"
    }
  }
}

window.addEventListener("load", () => {
  CMirrorBinding.initEditors()
})
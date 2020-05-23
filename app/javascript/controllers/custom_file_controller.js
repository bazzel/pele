import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    // debugger;
  }
  handleFile(e) {
    let file = e.target.files[0];
    this.label.innerText = file.name;
  }

  get label() {
    return this.element.querySelector("label");
  }
}

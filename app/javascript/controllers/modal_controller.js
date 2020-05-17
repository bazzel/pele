import { Controller } from "stimulus";
import $ from "jquery";

export default class extends Controller {
  connect() {
    this.showModal();
    this.putCursorInFirstInput();
  }

  showModal() {
    $(this.element).modal("show");
  }

  putCursorInFirstInput() {
    $(this.element).on("shown.bs.modal", () => {
      const firstInput = this.firstInput;

      if (firstInput) {
        firstInput.focus();
        firstInput.select();
      }
    });
  }

  get firstInput() {
    return this.element.querySelector('input[type="text"]');
  }
}

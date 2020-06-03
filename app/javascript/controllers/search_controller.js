import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["form"];

  perform(event) {
    this.formTarget.submit();
  }
}

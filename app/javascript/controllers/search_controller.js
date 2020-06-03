import _ from "lodash";
import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["form", "query"];

  connect() {
    this.moveCursorToEnd(this.queryTarget);
    this.perform = _.debounce(this._perform, 150).bind(this);
  }

  _perform(event) {
    event.preventDefault();
    this.formTarget.submit();
  }

  moveCursorToEnd(el) {
    if (typeof el.selectionStart == "number") {
      el.selectionStart = el.selectionEnd = el.value.length;
    } else if (typeof el.createTextRange != "undefined") {
      el.focus();
      const range = el.createTextRange();
      range.collapse(false);
      range.select();
    }
  }
}

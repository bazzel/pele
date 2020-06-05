import { Controller } from "stimulus";
import Autocomplete from "@trevoreyre/autocomplete-js";
import * as _ from "lodash";

// This controller turns a text input into a autocomplete text input.
//
// This controller works with specially annotated HTML like:
//
// <div class="autocomplete" data-controller="autocomplete">
//   <input type="text"/>
//   <input data-target="autocomplete.value" type="hidden"/>
//   <ul class="autocomplete-result-list"></ul>
// </div>
//
// The endpoint used by the `search` is expected to understand
// the Ransack search method and should be able to
// search for a `title` field.
// The JSON returned should be an array containing object with a `title` and `description`.
export default class extends Controller {
  static targets = ["value"];

  initialize() {
    new Autocomplete(this.element, {
      search: _.throttle(this._search, 200).bind(this),
      onSubmit: this.onSubmit.bind(this),
      getResultValue: ({ title }) => title,
      renderResult: this.renderResult,
    });
  }

  async _search(input) {
    this.valueTarget.value = "";
    this.input = input;

    if (input.length < 2) {
      return [];
    }
    const response = await fetch(`${this.url}?${this.query}`);
    return await response.json();
  }

  onSubmit({ id }) {
    this.valueTarget.value = id;
  }

  renderResult({ title, description }, props) {
    let text = title;

    if (description) {
      text = `${text} - <span class="text-muted">${description}</span>`;
    }

    return `<li ${props}>${text}</li>`;
  }

  get url() {
    return `${this.data.get("url")}.json`;
  }

  get query() {
    return `q[${this.data.get("field")}]=${encodeURI(this.input)}`;
  }
}

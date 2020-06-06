import { Controller } from "stimulus";
import Tagify from "@yaireo/tagify";

export default class extends Controller {
  initialize() {
    const tagify = new Tagify(this.element, {
      enforceWhitelist: this.enforceWhitelist,
      whitelist: this.whitelist,
      templates: {
        dropdownItem: function (tagData) {
          let { value: text, description } = tagData;

          if (description) {
            text = `<div>${text}</div><small>${description}</small>`;
          }

          try {
            return `<div class='tagify__dropdown__item ${
              tagData.class ? tagData.class : ""
            }'>${text}</div>`;
          } catch (err) {}
        },
      },
      dropdown: {
        searchKeys: ["description"],
      },
    });
  }

  get whitelist() {
    return JSON.parse(this.data.get("whitelist"));
  }

  get enforceWhitelist() {
    return this.data.get("enforce-whitelist") === "true";
  }
}

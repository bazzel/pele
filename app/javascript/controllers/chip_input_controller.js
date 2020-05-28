import { Controller } from "stimulus";
import Tagify from "@yaireo/tagify";

export default class extends Controller {
  initialize() {
    const tagify = new Tagify(this.element, {
      enforceWhitelist: true,
      whitelist: this.whitelist,
      templates: {
        dropdownItem: function (tagData) {
          try {
            return `<div class='tagify__dropdown__item ${
              tagData.class ? tagData.class : ""
            }'>
            <div>${tagData.value}</div>
            <small>${tagData.description}</small>
            </div>`;
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
}

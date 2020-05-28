import { Controller } from "stimulus";
import Tagify from "@yaireo/tagify";

export default class extends Controller {
  initialize() {
    const tagify = new Tagify(this.element, {
      // keepInvalidTags: true,
      whitelist: this.whitelist,
      xtemplates: {
        tag: function (v, tagData) {
          try {
            return `<tag title='${v}' contenteditable='false' spellcheck="false" class='tagify__tag ${
              tagData.class ? tagData.class : ""
            }' ${this.getAttributes(tagData)}>
                      <x title='remove tag' class='tagify__tag__removeBtn'></x>
                      <div>
                          <span class='tagify__tag-text'>${tagData.name}</span>
                      </div>
                  </tag>`;
          } catch (err) {}
        },
        dropdownItem: function (tagData) {
          try {
            return `<div class='tagify__dropdown__item ${
              tagData.class ? tagData.class : ""
            }'>
                      <span>${tagData.value} -  ${tagData.email}</span>
                  </div>`;
          } catch (err) {}
        },
      },
      enforceWhitelist: true,
    });
  }

  get whitelist() {
    return JSON.parse(this.data.get("whitelist"));
  }
}

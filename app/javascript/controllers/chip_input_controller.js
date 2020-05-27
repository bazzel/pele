import { Controller } from "stimulus";
import Tagify from "@yaireo/tagify";

export default class extends Controller {
  initialize() {
    const tagify = new Tagify(this.element, { enforceWhitelist: true });
  }
}

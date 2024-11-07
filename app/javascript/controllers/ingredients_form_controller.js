import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["wrapper", "template"];

  addField(event) {
    event.preventDefault();
    const content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime());
    this.wrapperTarget.insertAdjacentHTML("beforeend", content);
  }

  removeField(event) {
    event.preventDefault();
    const field = event.target.closest(".nested-fields");
    if (field) field.remove();
  }
}
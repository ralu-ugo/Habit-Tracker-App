import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
  console.log("hello1!!");
  }

  static targets = ["checkbox", "checkall"]

  checkAll() {
  if (this.checkallTarget.checked) {
    this.checkboxTargets.forEach((checkboxx) => {
      checkboxx.checked = true;
    }) } else {
      this.checkboxTargets.forEach((checkboxx) => {
        checkboxx.checked = false;
    });
    }
  }
}

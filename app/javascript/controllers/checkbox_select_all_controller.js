import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
  console.log("hello111oooo");
  }

  static targets = ["checkbox", "checkall"]

  checkAll() {
console.log(this.checkboxTargets)

    //  (this.checkallTarget.checked) {
      this.checkboxTargets.forEach((checkboxx) => {
        checkboxx.checked != checkboxx.checked;
      // }) } else {
      //   this.checkboxTargets.forEach((checkboxx) => {
      //     checkboxx.checked = false;
      });
    }

  }


import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]

  connect() {
  console.log("hello")
  console.log(this.targets)
  }

  toggleIcon(event) {
    event.currentTarget.classList.toggle("icon-active")
  };


}

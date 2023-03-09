import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]

  connect() {
  console.log("hello")
  }

  toggleIcon() {
    this.targets.forEach((target) => {
      const clickedTarget = target.currentTarget;
      clickedTarget.classList.toggle("icon-active")
    });
  }
}

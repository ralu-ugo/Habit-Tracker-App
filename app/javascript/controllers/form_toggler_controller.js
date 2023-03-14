import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["inputs"]

  connect() {
  console.log("yo")
  this.csfrToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")
  }

  toggleForm(event) {
    event.preventDefault()
    this.inputsTarget.classList.toggle("d-none")
  }

}

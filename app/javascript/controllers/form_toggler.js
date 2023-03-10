import { Controller } from "@hotwired/stimulus"


// app/javascript/controllers/form-toggler_controller.js
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "form" ]

  toggleForm() {
    this.formTarget.classList.toggle("hidden")
  }
}

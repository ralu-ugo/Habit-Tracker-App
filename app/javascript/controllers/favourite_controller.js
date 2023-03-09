import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favourite"
export default class extends Controller {
  static targets = [ "star" ]
  connect() {
    // console.log('i am here')
  }

  colorStar(e) {
    this.starTarget.classList.toggle("white")
  }
}

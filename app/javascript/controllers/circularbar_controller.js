import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const circle = new CircularProgressBar("pie");
    circle.initial();
  }
}

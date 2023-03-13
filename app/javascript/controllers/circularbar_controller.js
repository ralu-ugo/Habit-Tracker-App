import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
  console.log("hello");
  const circle = new CircularProgressBar("pie");
  circle.initial();
  }
}

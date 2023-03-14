import { Controller } from "@hotwired/stimulus"
import CircleProgress from 'js-circle-progress'

// Connects to data-controller="progress-circle"
export default class extends Controller {
  static values = {
    percent: Number

  }

  connect() {
    new CircleProgress(this.element, {
      value: this.percentValue,
      max: 100,
      textFormat: 'percent',
    });
  }
}

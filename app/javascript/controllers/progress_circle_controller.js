import { Controller } from "@hotwired/stimulus"
import CircleProgress from 'js-circle-progress'
import Chartkick from "chartkick";

// Connects to data-controller="progress-circle"
export default class extends Controller {
  static values = {
    percent: Number

  }

  connect() {
    console.log(percent)
    new CircleProgress(this.element, {
      value: 30,
      // value: this.percentValue,
      max: 100,
      textFormat: 'percent',
    });

  }
}

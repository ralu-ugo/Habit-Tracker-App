import { Controller } from "@hotwired/stimulus"
import CircleProgress from 'js-circle-progress'

export default class extends Controller {
  static values = {
    maxDays: Number,
    completionDays: Number,
  }
  connect() {
    console.log(this.maxDaysValue)
    console.log(this.completionDaysValue)
    new CircleProgress(this.element, {
      value: this.completionDaysValue,
      max: this.maxDaysValue
    });
  }
}

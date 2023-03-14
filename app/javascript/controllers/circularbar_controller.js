import { Controller } from "@hotwired/stimulus"
import CircleProgress from 'js-circle-progress'

export default class extends Controller {
  static values = {
    maxDays: Number,
    completionDays: Number
  }
  connect() {
    console.log(this.maxDaysValue)
    console.log(this.completionDays)
    new CircleProgress('.progress', {
      max: this.maxDaysValue,
      value: this.completionDays,
      textFormat: function(value, max) {
        return value + ' days';
      },
    });
  }
}

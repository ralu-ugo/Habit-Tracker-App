import { Controller } from 'stimulus';
import Sortable from 'stimulus-sortable';

export default class extends Controller {
  static targets = ['list'];

  connect() {
    this.sortable = Sortable.new(this.listTarget, {
      draggable: '.day-card',
      onEnd: this.handleEnd.bind(this)
    });
  }

  handleEnd(event) {
    // Handle the completion of the habit here
    event.item.classList.add('completed');
  }
}

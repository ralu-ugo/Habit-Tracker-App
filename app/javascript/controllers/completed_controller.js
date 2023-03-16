import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["habitslot", "cardWrapper", "completedWrapper"];

  connect() {
    this.csrfToken = document
      .querySelector('meta[name="csrf-token"]')
      .getAttribute("content");
    let status = this.element.getAttribute("data-completed");
    console.log(status);
  }

  async completed(event) {
    event.preventDefault();

    // Get the necessary data attributes
    let status = this.element.getAttribute("data-completed");
    console.log(status);
    const habitSlot = event.target.closest(".day-card");
    const habitSlotId = habitSlot.dataset.id;
    const habitId = this.element.dataset.habitid;
    const date = this.element.dataset.date;

    // Update the habit slot in the database
    const data = { habit_slot: { completed: !this.completedValue } };
    fetch(`/habits/${habitId}/habit_slots/${habitSlotId}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": this.csrfToken,
      },
      body: JSON.stringify(data),
    })
      .then(() => {
        // Update UI
        this.completedValue = !this.completedValue;
        const card = habitSlot;
        this.completedValue
          ? card.closest(".not-completed").removeChild(card)
          : card.closest(".completed").removeChild(card);
        location.reload();
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  }
}

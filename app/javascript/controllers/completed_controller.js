import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["habitslot"]

  connect() {
  console.log("hello")
  this.csfrToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")
  }

  completed(event) {
    event.preventDefault()

    event.currentTarget.classList.toggle("favourite-toggle-colour")
    const habitslot_id = this.habitslotTarget.dataset.id
    const habit_id = this.habitslotTarget.dataset.habitId;
    // const completed = this.habitslotTarget.dataset.completed === "true"
    // const data = { completed: true };



    const formData = new FormData()
    formData.append("habit_slot[completed]", "true")

    fetch(`/habits/${habit_id}/habit_slots/${habitslot_id}`, {
      method: "PATCH",
      headers: {
        "Accept": "application/json",
        "X-CSRF-Token": this.csfrToken
      },
      body: formData
    })
      .then(response => response.json())
      .then((data) => {

        console.log(data.card)
        console.log(this.habitslotTarget)
        this.habitslotTarget.innerHTML = data.card
      })
  };
}

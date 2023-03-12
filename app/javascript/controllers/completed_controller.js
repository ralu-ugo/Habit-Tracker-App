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
    const completed = this.habitslotTarget.dataset.completed === "true"
    const data =  { completed: true };
    
    console.log(habitslot_id)
    console.log(habit_id)
    console.log(completed)
    console.log(data)


    fetch(`/habits/${habit_id}/habit_slots/${habitslot_id}`, {
      method: "PATCH",
      headers: { "Content-Type": "application/json", "X-CSRF-Token":this.csfrToken },
      body: JSON.stringify(data)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
  };
}

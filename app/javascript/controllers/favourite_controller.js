import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["habit"]

  connect() {
  console.log("hello")
  this.csfrToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")
  }

  favourite(event) {
    event.preventDefault()

    event.currentTarget.classList.toggle("favourite-toggle-colour")
    const id = this.habitTarget.dataset.id
    const favourite = this.habitTarget.dataset.favourite === "true"
    const data =  { favourite: !favourite };

    console.log(id)
    console.log(favourite)
    console.log(data)

    fetch(`/habits/favourite/${id}`, {
      method: "PATCH",
      headers: { "Content-Type": "application/json", "X-CSRF-Token": this.csfrToken },
      body: JSON.stringify(data)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
  };
}

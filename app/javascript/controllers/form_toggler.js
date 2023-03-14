import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "repeat"]

  connect() {
  console.log("hello")
  this.csfrToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")
  }

  toggleForm(event) {
    console.log(this.formTarget)
    console.log(this.repeatTarget)



    event.preventDefault()
    fetch(`/habits/new`, {
      method: "GET",
      headers: {
        "Accept": "application/json",
        "X-CSRF-Token": this.csfrToken
      },
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data.form)
        console.log(data)

        this.formTarget.insertAdjacentHTML("beforeend", data.form.innerHTML)


      })
  };
}

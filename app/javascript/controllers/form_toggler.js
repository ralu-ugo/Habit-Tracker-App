import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["formcontainer", "repeat"]

  connect() {
  // console.log(this.formTarget)
  this.csfrToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")
  }

  toggleForm(event) {
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
        console.dir(data.form)
        console.log(data)
        this.formcontainerTarget.innerHTML = data.form.innerHTML
      })
  };
}

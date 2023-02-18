import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = ["menu"]
  connect() {
    console.log("hello");
  }
  open() {
    console.log("clicked!")
    this.menuTarget.classList.toggle("show")
  }
}

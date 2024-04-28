import { Controller } from "@hotwired/stimulus";


export default class extends Controller {
  static targets = ["flashMessage"];

  connect() {
    const flashMessage = this.flashMessageTarget;

    if (flashMessage) {
      setTimeout(() => {
        flashMessage.classList.remove("opacity-0");
      }, 100);

      setTimeout(() => {
        flashMessage.classList.add("opacity-0");
      }, 3100); // 5 seconds delay before fading out
    }
  }
}

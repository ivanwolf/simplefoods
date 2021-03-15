import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["content"];

  connect() {
    this.listener = (event) => {
      this.show(event.detail.message);

      this.timeout = setTimeout(() => {
        this.hide();
      }, event.detail.duration || 5000);
    };

    window.addEventListener("toast:show", this.listener);
  }

  disconnect() {
    window.removeEventListener("toadt:show", this.listener);
  }

  show(message = "") {
    this.contentTarget.textContent = message;
    this.element.classList.toggle("-mb-16");
  }

  hide() {
    this.element.classList.toggle("-mb-16");
    clearTimeout(this.timeout);
  }
}

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["content"];

  connect() {
    this.listener = (event) => {
      this.contentTarget.textContent = event.detail.message;

      this.show();

      this.timeout = setTimeout(() => {
        this.hide();
      }, event.detail.duration || 5000);
    };

    window.addEventListener("toast:show", this.listener);
  }

  disconnect() {
    window.removeEventListener("toast:show", this.listener);
  }

  show() {
    this.element.classList.toggle("-mb-16");
  }

  hide() {
    this.element.classList.toggle("-mb-16");
    clearTimeout(this.timeout);
  }
}

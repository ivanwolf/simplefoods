import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["content"];

  connect() {
    this.listener = (event) => {
      this.contentTarget.textContent = event.detail.message;

      this.show(event.detail.messageType);

      this.timeout = setTimeout(() => {
        this.hide();
      }, event.detail.duration || 5000);
    };

    window.addEventListener("toast:show", this.listener);
  }

  disconnect() {
    window.removeEventListener("toast:show", this.listener);
  }

  show(messageType) {
    if (messageType === "error") {
      this.element.classList.toggle("bg-red-500");
    }
    if (messageType === "success") {
      this.element.classList.toggle("bg-green-500");
    }
    this.element.classList.toggle("-mb-20");
  }

  hide() {
    this.element.classList.toggle("-mb-20");
    this.element.classList.toggle("bg-red-500");
    this.element.classList.toggle("bg-green-500");
    clearTimeout(this.timeout);
  }
}

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["content"];

  connect() {
    this.listener = (event) => {
      const { message, messageType, duration } = event.detail;

      this.contentTarget.textContent = message;

      this.show(messageType);

      this.timeout = setTimeout(() => {
        this.hide(messageType);
      }, duration || 5000);
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
    if (messageType === "notice") {
      this.element.classList.toggle("bg-green-500");
    }

    this.element.classList.toggle("-mb-20");
  }

  hide(messageType) {
    if (messageType === "error") {
      this.element.classList.toggle("bg-red-500");
    }
    if (messageType === "notice") {
      this.element.classList.toggle("bg-green-500");
    }

    this.element.classList.toggle("-mb-20");
    clearTimeout(this.timeout);
  }
}

import { Controller } from "stimulus";

export default class extends Controller {
  static values = { message: String, messageType: String, duration: Number };

  connect() {
    const event = new CustomEvent("toast:show", {
      detail: {
        message: this.messageValue,
        messageType: this.messageTypeValue,
        duration: this.durationValue,
      },
    });

    window.dispatchEvent(event);
  }
}

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["source"];

  copy() {
    this.sourceTarget.select();
    document.execCommand("copy");

    const event = new CustomEvent("toast:show", {
      detail: {
        message: "¡Enlace copiado!",
        duration: 5000,
      },
    });

    window.dispatchEvent(event);
  }
}

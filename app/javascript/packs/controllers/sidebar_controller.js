import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["container"];

  show() {
    this.containerTarget.classList.remove("-translate-x-full");
  }

  hide() {
    this.containerTarget.classList.add("-translate-x-full");
  }
}

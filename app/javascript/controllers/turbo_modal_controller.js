import { Controller } from "@hotwired/stimulus";
import { Turbo } from "@hotwired/turbo-rails";

// Connects to data-controller="turbo-modal"
export default class extends Controller {
  followRedirect(event) {
    const fetchResponse = event.detail.fetchResponse;

    history.pushState(
      { turbo_frame_history: true },
      "",
      fetchResponse.response.url
    );

    Turbo.visit(fetchResponse.response.url);
  }

  closeModal() {
    this.element.parentElement.removeAttribute("src");
    this.element.remove();
  }
}

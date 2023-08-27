import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="draggable"
export default class extends Controller {
  dragStart(event) {
    event.dataTransfer.setData(
      "application/drag-key",
      event.target.getAttribute("data-card-id")
    );
    event.dataTransfer.effectAllowed = "move";
    console.log(
      `Card Target is ${event.dataTransfer.getData("application/drag-key")}`
    );
  }

  dragOver(event) {
    console.log("Dragover");
    event.preventDefault();
    return event.target.className === "card-container";
  }

  dragEnter(event) {
    console.log("Dragenter");
  }

  drop(event) {
    event.preventDefault();

    console.log(`Dropping in ${event.target}`);
    if (event.target.className === "card-container") {
      this.cardTarget.parentNode.removeChild(this.cardTarget);
      event.target.appendChild(this.cardTarget);
    }
  }

  dragEnd(event) {}
}

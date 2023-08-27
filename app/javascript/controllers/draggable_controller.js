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

    const dropTarget = event.target;
    const draggedItemId = event.dataTransfer.getData("application/drag-key");
    console.log(`Dragged item id: ${draggedItemId}`);

    let draggedItem = this.element.querySelector(
      `[data-card-id='${draggedItemId}']`
    );

    if (!!draggedItem) {
      this.moveWithinLane(dropTarget, draggedItem);
    } else {
      this.moveToNewLane(dropTarget, draggedItemId);
    }
  }

  moveWithinLane(dropTarget, draggedItem) {
    const positionComparison = dropTarget.compareDocumentPosition(draggedItem);
    if (positionComparison & 4) {
      dropTarget.insertAdjacentElement("beforebegin", draggedItem);
    } else if (positionComparison & 2) {
      dropTarget.insertAdjacentElement("afterend", draggedItem);
    }
  }

  moveToNewLane(dropTarget, draggedItemId) {
    const draggedItem = document.querySelector(
      `[data-card-id='${draggedItemId}']`
    );
    const positionComparison = dropTarget.compareDocumentPosition(draggedItem);

    console.log(positionComparison);
    if (positionComparison & 4) {
      dropTarget.insertAdjacentElement("beforebegin", draggedItem);
    } else if (positionComparison & 2) {
      dropTarget.insertAdjacentElement("afterend", draggedItem);
    }
    dropTarget.insertAdjacentElement("afterbegin", draggedItem);
  }

  dragEnd(event) {}
}

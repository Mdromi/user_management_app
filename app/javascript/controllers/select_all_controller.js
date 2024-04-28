import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["checkbox"];

  toggleAll(event) {
    const isChecked = event.target.checked;
    this.checkboxTargets.forEach((checkbox) => {
      checkbox.checked = isChecked;
    });
    // this.updateSelectedUserIds();
  }

  updateSelectedUserIds(event) {
    event.preventDefault(); // Prevent the default form submission behavior
    
    const selectedUserIds = this.checkboxTargets
      .filter((checkbox) => checkbox.checked)
      .map((checkbox) => parseInt(checkbox.value, 10)); // Always specify radix when using parseInt
    
    const form = event.target.closest("form");
    const hiddenField = form.querySelector("[data-target='select-all.selectedUserIds']");
    hiddenField.value = selectedUserIds.join(","); 
    console.log(selectedUserIds);
    
    // Now you can submit the form via JavaScript if needed
    form.submit();
  }
}

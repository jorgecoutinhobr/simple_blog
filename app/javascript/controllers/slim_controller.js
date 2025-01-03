import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="slim"
export default class extends Controller {
  connect() {
    const placeholderText = this.element.dataset.placeholder
    const searchPlaceholderText = this.element.dataset.search
    new SlimSelect({
      select: this.element,
      settings: {
        placeholderText:  placeholderText,
        searchPlaceholder: searchPlaceholderText
      }
    })
  }
}

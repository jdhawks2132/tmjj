import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
	static targets = ['content', 'icon', 'helperText'];

	connect() {
		this.toggleIcon();
	}

	toggle() {
		this.contentTarget.classList.toggle('hidden');
		this.toggleIcon();
	}

	toggleIcon() {
		const isOpen = !this.contentTarget.classList.contains('hidden');
		this.iconTarget.innerHTML = isOpen
			? '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 12h12" />' // minus icon
			: '<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v12m6-6H6" />'; // plus icon
		this.helperTextTarget.textContent = isOpen
			? 'Hide New Event Form'
			: 'Show New Event Form';
	}
}

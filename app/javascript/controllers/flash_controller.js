import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
	static targets = ['notice', 'alert'];
	static values = { timeout: Number };

	connect() {
		this.hideFlash(this.noticeTarget);
		this.hideFlash(this.alertTarget);
	}

	hideFlash(element) {
		if (element.textContent.trim() === '') {
			element.style.display = 'none';
		} else {
			setTimeout(() => {
				element.textContent = '';
				element.classList.add('hidden'); // Or `element.style.display = 'none';`
			}, this.timeoutValue);
		}
	}
}

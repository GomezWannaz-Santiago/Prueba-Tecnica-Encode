import { Component, OnDestroy } from '@angular/core';
import { NgbTooltipModule } from '@ng-bootstrap/ng-bootstrap';

import { ToastService } from 'src/app/services/toast.service';
import { ToastsContainer } from './toast-container.component';

@Component({
	selector: 'ngbd-toast-global',
	standalone: true,
	imports: [NgbTooltipModule, ToastsContainer],
	templateUrl: './toast-global.component.html',
})
export class NgbdToastGlobal implements OnDestroy {
	constructor(public toastService: ToastService) {}

	showStandard() {
		this.toastService.show('I am a standard toast');
	}

	showSuccess() {
		this.toastService.show('I am a success toast', { classname: 'bg-success text-light', delay: 10000 });
	}

	showDanger() {
		this.toastService.show("I am a danger toast", { classname: 'bg-danger text-light', delay: 15000 });
	}

	ngOnDestroy(): void {
		this.toastService.clear();
	}
}

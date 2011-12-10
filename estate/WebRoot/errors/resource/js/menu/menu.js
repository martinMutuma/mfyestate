	var contents = document.getElementsByClassName('content');
	var toggles = document.getElementsByClassName('type');
	var myAccordion = new fx.Accordion(
		toggles, contents, {opacity: true, duration: 400}
	);
	myAccordion.showThisHideOpen(contents[0]);

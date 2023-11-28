import "popper";
import "bootstrap";

// Import Stimulus
import { Application } from "@hotwired/stimulus";
import 'es-module-shims';

// Start Stimulus application
const application = Application.start();

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;
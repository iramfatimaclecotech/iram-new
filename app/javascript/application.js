

import "bootstrap";
import "popper";

import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";
import StimulusReflex from "@hotwired/stimulus-reflex";

const application = Application.start();
const context = require.context('./controllers', true, /\.js$/);
application.load(definitionsFromContext(context));
StimulusReflex.initialize(application);

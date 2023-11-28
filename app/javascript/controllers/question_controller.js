import { Controller } from "stimulus";

export default class extends Controller {
  connect() {
    this.formTarget.addEventListener("ajax:success", (event) => {
      const [data, _status, _xhr] = event.detail;
      const frame = TurboFrames.findFrameElement(data['turbo-frame']);

      TurboStreams.replace(frame, data['turbo-stream']);
    });
  }

  get formTarget() {
    return this.targets.find("form");
  }

  handleAjaxSuccess(event) {
    const [data, _status, _xhr] = event.detail;

    // Determine the action type based on the presence of Turbo Stream data
    const action = data['turbo-stream'] ? 'replace' : 'insert';

    // Find the Turbo Frame element based on the data['turbo-frame'] attribute
    const frame = TurboFrames.findFrameElement(data['turbo-frame']);

    // Perform the appropriate Turbo Streams action on the Turbo Frame
    TurboStreams[action](frame, data['turbo-stream']);
  }


  create() {
    this.targets.stimulate("create", this.element);
  }

  // Method to handle the "edit" action
  edit() {
    this.targets.stimulate("edit", this.element);
  }

  // Method to handle the "update" action
  update() {
    this.targets.stimulate("update", this.element);
  }


  destroy() {
    this.targets.stimulate("destroy", this.element);
  }
}
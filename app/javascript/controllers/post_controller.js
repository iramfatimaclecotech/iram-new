import ApplicationController from './application_controller'

const turboStream = await response.text();
this.stimulate('replace', turboStream);
  
export default class extends ApplicationController {
  

  async create() {
    const form = this.formTarget;
    const response = await fetch(form.action, {
      method: 'POST',
      body: new FormData(form),
    });

    if (response.ok) {
      const turboStream = await response.text();
      this.listTarget.innerHTML = turboStream;
    } else {
      console.error('Error creating post');
    }
  }

  async update(event) {
    event.preventDefault();
    const postId = event.target.dataset.postId;
    console.log(`Updating post with ID: ${postId}`);
    this.stimulate("Post#update", postId, { target: "post-list" });
  }


  async destroy(event) {
    const postId = event.target.dataset.postId;
    const response = await fetch(`/posts/${postId}`, {
      method: 'DELETE',
    });

    if (response.ok) {
      const turboStream = await response.text();
      this.listTarget.innerHTML = turboStream;
    } else {
      console.error('Error destroying post');
    }
  }
}

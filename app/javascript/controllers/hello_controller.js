// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['output', 'button', 'container']

  greet() {
    this.outputTarget.textContent = 'Hello, this is a Rails 6.1 template with StimulusJS!';
    this.containerTarget.classList.replace('alert-primary', 'alert-info');
    this.buttonTarget.hidden = true;
  }
}
